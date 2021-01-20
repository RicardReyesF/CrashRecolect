import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioAuth{
  final String _idToken="AIzaSyBQ4dmEAXS_6p5c-bgxKkatgNFqrLrS2A8";


  Future nuevoUser(String correo,String password) async {
    final authData={
      'email': correo,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_idToken',
      body: json.encode(authData)
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if(decodedResp.containsKey('idToke')){
      return { 'ok': true , 'token': decodedResp['idToken']};
    }else{
      return {'ok' : false, 'mensaje': decodedResp['error']['message']};
    }
  }


}