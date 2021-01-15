import 'dart:io';

import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({Key key}) : super(key: key);

  @override
  _ProfileAdminPageState createState() => _ProfileAdminPageState();
}

final formKey = GlobalKey<FormState>();
File foto;
String nombre="Nombre de tu empresa";
String ubicacion="Donde se encuentra";
final profileProvider= ProfileProvider();
Profile profileModel=Profile();

class _ProfileAdminPageState extends State<ProfileAdminPage> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nombre
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                 icon: Icon(Icons.create_outlined,color: Colors.white),
                 onPressed: ()=>_nameF()
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ubicacion
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                IconButton(
                  icon: Icon(Icons.create_outlined,color: Colors.white,), 
                  onPressed: ()=>_location()
                ),
                IconButton(
                  icon: Icon(Icons.gps_fixed_outlined,color: Colors.white,), 
                  onPressed: ()=>Navigator.pushNamed(context,'location',arguments:profileModel)
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
                  onPressed: ()=>_submit1(),
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
   if( profileModel.image != null ){
        return FadeInImage(
        image: NetworkImage(profileProvider.cargarPhoto().toString()),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fit:BoxFit.cover,
        width: 120.0,
        height: 120.0
      );
      }else{
        return Image(
          image: AssetImage(foto?.path ?? 'assets/no-image.png'),
          fit: BoxFit.cover,
          width: 120.0,height: 120.0,);
      }
      
 }

 Future _nameF(){
      return showDialog(
        context: context,
        builder: (context)=>Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 180.0,
          child: Card(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top:20),
                    width: 270.0,
                    height: 75.0,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    initialValue: '',
                    validator: (value){
                      if(value.length < 0){
                        return "Demasiado Corto";
                      }else {
                        return null;
                      }
                    },
                    onSaved: (value){
                      setState(() {
                      nombre=value;
                      profileModel.nom=value;
                      });
                    },
                  ),
                ), 
                RaisedButton(onPressed: _submit,
                    shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey),
                    ),
                    color: Colors.lightBlueAccent,
                    child: Text('Agregar',style: TextStyle(
                      color: Colors.blueGrey
                    ),
                  ),
                )
               ],
              ),
            ),
          ),
        ),
      ),
      );
    }
    Future _location(){
      return showDialog(
        context: context,
        builder: (context)=>Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 180.0,
          child: Card(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top:20),
                    width: 270.0,
                    height: 75.0,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    initialValue: '',
                    validator: (value){
                      if(value.length < 0){
                        return "Demasiado Corto";
                      }else {
                        return null;
                      }
                    },
                    onSaved: (value){
                      setState(() {
                      ubicacion=value;
                      profileModel.location=value;
                      });
                    },
                  ),
                ), 
                RaisedButton(onPressed: _submit,
                    shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey),
                    ),
                    color: Colors.lightBlueAccent,
                    child: Text('Agregar',style: TextStyle(
                      color: Colors.blueGrey
                    ),
                  ),
                )
               ],
              ),
            ),
          ),
        ),
      ),
      );
    }

    void _submit() async {
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
    if ( foto != null ) {
      profileModel.image = await profileProvider.subirImagen(foto);
    }
    print(profileModel.nom);
    print(profileModel.location);


   Navigator.popAndPushNamed(context, 'profile');
  }

  void _submit1(){
/*
    if (!formKey.currentState.validate()) {
    print('Todo ok');
    formKey.currentState.save();
    */
    profileProvider.crearProfile(profileModel);
    print(profileModel.location);
    print(profileModel.nom);
    print(profileModel.geo);
  }
    
}