import 'dart:convert';
import 'package:crash_recolect/src/models/user_model.dart';
import 'package:http/http.dart' as http;


class UserProvider{

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearUser(UserModel userModel) async {
    final url ='$_url/User.json';

    final resp = await http.post(url,body: userModelToJson(userModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<UserModel>> cargarUser() async {
    final url ='$_url/User.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<UserModel> user = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,use) { 

      final userTemp= UserModel.fromJson(use);
      userTemp.id= id;

      user.add(userTemp);

    });


    return user;
  }
  /*
    Future<List<UserModel>> valida(corr,pass,ro) async {
    final url ='$_url/User.json';

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    if (decodedData.toString() !='[]'){

    }

    decodedData.forEach((id,use) { 

      final userTemp= UserModel.fromJson(use);
      userTemp.id= id;
      if(userTemp.password==pass && userTemp.correo==corr && userTemp.role==ro){
      
      }
      user.add(userTemp);

    });


    return user;
  }
*/
  Future<int> borrarUser(String id) async {
    final url ='$_url/User/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarUser(UserModel userModel) async {
    final url ='$_url/User/${userModel.id}.json';

    final resp = await http.put(url,body: userModelToJson(userModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
  
}