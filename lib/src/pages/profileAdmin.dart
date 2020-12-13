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
                      child: GestureDetector(
                        onTap:_typePhoto,
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


  void _seleccionarFoto(BuildContext context) async {

    foto =await ImagePicker.pickImage(
      source: ImageSource.gallery);
      if(foto != null){

      }
      setState(() {
        
      });

  }
  
  
  void _tomarFoto(BuildContext context) async {

    foto=await ImagePicker.pickImage(
      source: ImageSource.camera);
       if(foto != null){

      }
      setState(() {
        
      });

  }



  Future  _typePhoto(){
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Desde donde desea cambiar lo imagen"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              GestureDetector(
                child: Text("Galeria"),
                onTap: (){_seleccionarFoto(context);},
              ),
              Padding(
                padding: EdgeInsets.all(10.0)
                ),
              GestureDetector(
                child: Text("Camara"),
                onTap:(){_tomarFoto(context);},
              ),
              
              
            ],
          ),
        ),      
      )
    );
  }
  
  
_mostrarImagen(){
   if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          width: 120.0,
          height: 120.0,
        );
      }
      return Image.asset('assets/no-image.png',fit: BoxFit.cover,width: 120.0,height: 120.0,);
 }

  
}