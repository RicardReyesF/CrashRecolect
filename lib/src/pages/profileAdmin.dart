import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({Key key}) : super(key: key);

  @override
  _ProfileAdminPageState createState() => _ProfileAdminPageState();
}
File foto;
class _ProfileAdminPageState extends State<ProfileAdminPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          _body()
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
                      backgroundImage: AssetImage(
                          "assets/no-image.png"
                      ),
                      radius: 60.0,
                    ),
                  ),
                ),
                 
              ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Nombre de tu empresa"
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                 icon: Icon(Icons.create_outlined,color: Colors.white),
                 onPressed: (){})
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Donde se encuentra"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                  icon: Icon(Icons.create_outlined,color: Colors.white,), 
                  onPressed: (){}
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed_outlined,color: Colors.white,), 
                  onPressed: (){}
                ),
              ],
            ),
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
                  onPressed: (){
                  },
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 100.0,maxHeight: 40.0,),
                      alignment: Alignment.center,
                      child: Text(
                        "Guardar",
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
                  onPressed: (){
                  },
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


  _seleccionarFoto() async {

    ImagePicker.pickImage(
      source: ImageSource.gallery);

  }
  
  
  _tomarFoto() async {

    ImagePicker.pickImage(
      source: ImageSource.camera);

  }


/*
  Future _typePhoto(){
   return showDialog(
      context: context,
      builder: (context) => Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 250.0,
          child: Column(
            children: [
              Container(
                width: 100.0,
                height: 150.0,
                child: GestureDetector(
                  onTap: _tomarFoto(),
                  child: Text("Tomar Foto"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  */
 Widget _mostrarFoto() {
      return Image(

        image: AssetImage( foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }
  
}