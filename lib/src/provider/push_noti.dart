import 'dart:convert';
import 'package:crash_recolect/src/models/notificacion_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class NotificacionProvider{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user;

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  
  Future<List<NotificacionesModel>> cargarNoti() async {
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
    final url ='$_url/notificacion.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<NotificacionesModel> noti = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,noti) { 

      final notiTemp= NotificacionesModel.fromJson(noti);
      notiTemp.id= id;

      noti.add(notiTemp);

    });


    return noti;
  }
  Future<int> borrarUser(String id) async {
    final url ='$_url/notificacion/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }
  
}