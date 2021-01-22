

import 'package:crash_recolect/src/models/notificacion_model.dart';
import 'package:crash_recolect/src/pages/ViewProfileAdmin.dart';
import 'package:crash_recolect/src/pages/my_service.dart';
import 'package:crash_recolect/src/pages/map_page.dart';
import 'package:crash_recolect/src/pages/profileAdmin.dart';
import 'package:crash_recolect/src/provider/push_noti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class HomePageAdm extends StatefulWidget {
  @override
  _HomePageAdmState createState() => _HomePageAdmState();
}
    final noti= NotificacionProvider(); 
    NotificacionesModel notiModel = new NotificacionesModel();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user; 
class _HomePageAdmState extends State<HomePageAdm> {
  final scaffoldKey =GlobalKey<ScaffoldState>();
 int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: _callPage(currentIndex),
      bottomNavigationBar: _navigationBar(),
      floatingActionButton: _fab(),
    );
  }

  Widget _navigationBar(){
     return BottomNavigationBar(
       backgroundColor: Colors.lightBlueAccent,
       unselectedItemColor: Colors.blueGrey,
       selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            title:Text('Añadir Producto')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            title:Text('Cuenta')
          )

        ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapPage();
      case 1: return MyServicePage();
      case 2: return ViewProfileAdminPage();
      default: return HomePageAdm();
    }
  }

  Widget _fab(){
    return FutureBuilder(
      future:noti.cargarNoti(),
      builder: (BuildContext context, AsyncSnapshot<List<NotificacionesModel>> snapshot){
        if(!snapshot.hasData){
          return FloatingActionButton(
            onPressed: ()=>_alert(context),
            heroTag: 'alert',
          );
        }
        return null;
      }
    );

  }
  void _alert(BuildContext context) async {
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
    FirebaseDatabase.instance
          .reference()
          .child('notificacion')
          .child(uID)
          .once()
          .then((DataSnapshot snapshot){
           notiModel.mensaje = snapshot.value['mensaje'];
           notiModel.uID=snapshot.value['uID'];
           notiModel.id=snapshot.value['id'];
          });

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context){
        return Hero(
          tag: 'alert',
          child: AlertDialog(
            title: Text("¡Notificacion nueva!"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${notiModel.mensaje}'),
                Row(
                  children: [
                    FlatButton(
                      onPressed: ()=>_noti2(),
                      child: Text("Cancelar")
                    ),
                    FlatButton(
                      onPressed: ()=>{},
                      child: Text("Navegar")
                    ),
                    
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Future _noti2() async {
    FirebaseDatabase.instance.reference().child('notificacionU').child('${notiModel.uID}').set({
      'status': 'true',
      'mensaje': "Lo siento sera para la proxima :(",      
     }).whenComplete((){
        _mostrarSnack('Se ha notificado');
        _eliminar();
     });
  }

  void _mostrarSnack(String mensaje ){
    final snackbar= SnackBar(
      content: Text(mensaje),
      duration: Duration(microseconds: 3500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void _eliminar(){
    FirebaseDatabase.instance.reference().child('notificacionU').child('${notiModel.id}').remove();
  }
}