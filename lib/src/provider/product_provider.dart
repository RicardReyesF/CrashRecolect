import 'dart:convert';
import 'package:crash_recolect/src/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductProvider{

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearProduct( Product productModel) async {
    final url ='$_url/productos.json';

    final resp = await http.post(url,body: productToJson(productModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<Product>> cargarProducto() async {
    final url ='$_url/productos.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

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
}