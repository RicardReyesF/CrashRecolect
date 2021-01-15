import 'dart:convert';
import 'dart:io';
import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;


class ProfileProvider{

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearProfile( Profile profileModel) async {
    final url ='$_url/profile.json';

    final resp = await http.post(url,body: profileToJson(profileModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<Profile>> cargarProfile() async {
    final url ='$_url/profile.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<Profile> profile = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,pro) { 

      final proTemp= Profile.fromJson(pro);
      proTemp.id= id;

      profile.add(proTemp);

    });

    print(profile);

    return profile;
  }

  Future<int> borrarPro(String id) async {
    final url ='$_url/profile/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarProfile(Profile profileModel) async {
    final url ='$_url/profile/${profileModel.id}.json';

    final resp = await http.put(url,body: profileToJson(profileModel));

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
  Future<Map<String,dynamic>> cargarPhoto() async {
    final url ='$_url/profile.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);
    
    print (decodedData);

    return decodedData['image'];
    
    /*
    final List<Profile> profile = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,pro) { 

      final proTemp= Profile.fromJson(pro);
      proTemp.id= id;

      profile.add(proTemp);

    });

    print(profile);

    return profile;
    */
  }
  
  
}