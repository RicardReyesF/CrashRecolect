import 'dart:convert';
import 'dart:io';
import 'package:crash_recolect/src/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;


class ProductProvider{
 final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user;

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearProduct( Product productModel) async {
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
    final url ='$_url/User/$uID/product.json';

    final resp = await http.post(url,body: productToJson(productModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<Product>> cargarProducto() async {
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
    final url ='$_url/User/$uID/product.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    print (decodedData);
    final List<Product> producto = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,pro) { 

      final proTemp= Product.fromJson(pro);
      proTemp.id= id;

      producto.add(proTemp);

    });

    print(producto);

    return producto;
  }

  Future<int> borrarPro(String id) async {
    final url ='$_url/productos/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarProduct(Product productModel) async {
    final url ='$_url/productos/${productModel.id}.json';

    final resp = await http.put(url,body: productToJson(productModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

    Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dc0tufkzf/image/upload?upload_preset=cwye3brj');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);


    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print( respData);

    return respData['secure_url'];


  }
}