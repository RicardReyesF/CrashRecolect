import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/pages/profileAdmin.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
  final profileProvider = new ProfileProvider();
  Profile profileModel= Profile();
    
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential user;
}
class _ViewPageState extends State<ViewPage> {
  final scaffoldKey =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            _tarjetas()
          ],
        ),
      )
    );
  }

  Widget _tarjetas(){
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: profileProvider.cargarProfile(),
      builder: (BuildContext context, AsyncSnapshot<List<Profile>>snapshot){
        if(snapshot.hasData){
          final profile=snapshot.data;
          return Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: _screenSize.width * 0.8,
            itemHeight: _screenSize.height * 0.7,
            itemCount: profile.length,
            itemBuilder: (context,i) => _crearItem(profile[i],context)  
          );
          
        }else{
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }  
    );
    
  }

  Widget _crearItem(Profile profileModel, BuildContext context){
    return Card( 
      child: Column(
        children: [
          ClipRRect(
                child: FadeInImage(
                  placeholder: AssetImage("assets/no-image.png"),
                  image: NetworkImage(profileModel.image)
                ),
              ),
              Container(
                height: 50.0,
              ),
               Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Row(
                      children: [
                        Icon(Icons.assignment_ind_sharp,color: Colors.grey,),
                        Text("  ""${profileModel.nom}",style: TextStyle(fontSize: 25.0),)
                      ],  
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      children: [
                        GestureDetector(
                        onTap: ()=>Navigator.pushNamed(context,"map",arguments: profileModel),
                        child: Row(children: [
                          Icon(Icons.gps_fixed_outlined,color: Colors.grey,),
                          Text("  ""${profileModel.location}",style: TextStyle(fontSize: 25.0),)
                      
                        ],),  
                        )
                        ],
                    ),
                    Text("${profileModel.id}"),
                  ],
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 60.0),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.navigation,color: Colors.blue,),
                            onPressed: ()=>_notificacion(profileModel.geo,profileModel.id)),
                          Text("Dirigete")
                        ],
                      ),
                    ),
                    
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.send,color: Colors.blue,),
                          onPressed: (){}),
                        Text("Notificar")
                      ],
                    ),
                  ],
                )
        ],
      ),
    );            
  }

  

  Widget _card(){
    return Card(
      child: Column(
        children: [
          Container(
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png"),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(40),
            title: Text('Nombre de la empresa'),
            subtitle: Text('Caracteristicas'),
          )
        ],
      ),
    );
  }


  Future _notificacion(String geo,String id) async{
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
     FirebaseDatabase.instance.reference().child('notificacion').child('$id').set({
      'status': true,
      'mensaje': "Hola podrias venir a por producto :)",
      'geo': geo,
      'uID': uID       
     }).whenComplete((){
        _mostrarSnack('Se ha notificado');
     });
  }

  void _mostrarSnack(String mensaje ){
    final snackbar= SnackBar(
      content: Text(mensaje),
      duration: Duration(microseconds: 3500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}