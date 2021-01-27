import 'dart:io';

import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewProfileUserPage extends StatefulWidget {
  const ViewProfileUserPage({Key key}) : super(key: key);

  @override
  _ViewProfileUserPageState createState() => _ViewProfileUserPageState();
}

final formKey = GlobalKey<FormState>();
File foto;
String nombre="Nombre de tu empresa";
String ubicacion="Donde se encuentra";
final profileProvider= ProfileProvider();
Profile profileModel=Profile();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserCredential user;

class _ViewProfileUserPageState extends State<ViewProfileUserPage> {
  @override
  
  Widget build(BuildContext context) {
    final Profile equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      profileModel = equiData;
    }
  
    return Scaffold(
      body: Stack(
        children: [
          
          _fondo(),
          
          FutureBuilder(
          future: _uID(),
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return _body();
            }
              return _body1();
          })
        ],
      ),
    );
  }

  Widget _fondo(){
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]
            ),
          )
        );
  }

  Widget _body(){
    if(profileModel.nom==null){
      profileModel.nom='Cual es tu nombre';
    }
  _uID();
  return SafeArea(
        child: Column(      
          children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/logo.png"
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: _mostrarImagen(),
                          ),
                          /*
                          child: IconButton(
                            padding: EdgeInsets.only(top:100.0,left: 60.0),
                            icon: Icon(Icons.camera_alt),
                            onPressed: _typePhoto
                          ),
                          */
                          radius: 60.0,
                        ),
                    
                    ),
                  ),
                ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${profileModel.nom}"
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),/*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${profileModel.location}"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed), 
                  onPressed: ()=>Navigator.pushReplacementNamed(context,'mapview'))
              ],
            ),
            */
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: ()=>Navigator.pushReplacementNamed(context,'profileeditUser',arguments: profileModel),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Editar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: ()=>Navigator.pushNamed(context,'login'),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
  }

  Widget _body1(){
  _uID();
  return SafeArea(
        child: Column(      
          children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/logo.png"
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment(0.0,2.5),
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: _mostrarImagen(),
                          ),
                          /*
                          child: IconButton(
                            padding: EdgeInsets.only(top:100.0,left: 60.0),
                            icon: Icon(Icons.camera_alt),
                            onPressed: _typePhoto
                          ),
                          */
                          radius: 60.0,
                        ),
                    
                    ),
                  ),
                ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${profileModel.nom}"
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),/*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${profileModel.location}"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed), 
                  onPressed: ()=>Navigator.pushReplacementNamed(context,'mapview'))
              ],
            ),
            */
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: ()=>Navigator.pushReplacementNamed(context,'profileeditUser',arguments: profileModel),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Editar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                RaisedButton(
                  color: Colors.blueGrey,
                  onPressed: ()=>Navigator.pushNamed(context,'login'),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Cerrar Sesión",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
  }



  
  
  
_mostrarImagen(){
   if( profileModel.image != null ){
        return FadeInImage(
        image: NetworkImage(profileModel.image.toString()),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fit:BoxFit.cover,
        width: 120.0,
        height: 130.0
      );
      }else{
        if(foto !=null){
          return Image.file(
          foto,
          fit: BoxFit.cover,
          width: 120.0,height: 120.0
        );
        }
        return Image.asset("assets/no-image.png");
        
      }
/*
          image: AssetImage(foto?.path ?? ''),
          fit: BoxFit.cover,
          width: 120.0,height: 120.0,);
  */    
 }

  

  _uID() async  {
    final User user = await firebaseAuth.currentUser;
     String uID=user.uid;
     
     FirebaseDatabase.instance.reference().child('User').child(uID).child('profile').once().then((DataSnapshot snapshot){ 
       
        profileModel.image = snapshot.value['image'];
        profileModel.geo=snapshot.value['geo'];
        profileModel.nom=snapshot.value['nom'];
        profileModel.location=snapshot.value['location'];
       print(profileModel.image);
       print(profileModel.geo);
       print(profileModel.nom);
       print(profileModel.location);
     });
  }
    
}