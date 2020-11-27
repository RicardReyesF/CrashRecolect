import 'package:flutter/material.dart';

class MyServicePage extends StatelessWidget {
  const MyServicePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         _fondo(),
         _letras()
       ],
     ),
     floatingActionButton: _fab(context),
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
  
  Widget _letras(){
    return Padding(
      padding: EdgeInsets.only(top:50.0),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(
          'Mis Servicios',
          style: TextStyle(

            color: Colors.white,
            fontSize: 38.0,
            fontWeight: FontWeight.w900
          )
        ),
      ),
    );
  }

  Widget _fab(context){
    return FloatingActionButton(
      onPressed: ()=> Navigator.pushNamed(context, "product"),
      child: Image.asset("assets/add.png"),
    );
  }

}