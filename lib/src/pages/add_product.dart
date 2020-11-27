import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         _fondo(),
         Column(
           children: [
             _letras(),
            _letras1(),
            _product(),
           ],
          )
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
  
  Widget _letras(){
    return Padding(
      padding: EdgeInsets.only(top:50.0),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(
          'Agrega un producto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 38.0,
            fontWeight: FontWeight.w900
          )
        ),
      ),
    );
  }

    Widget _letras1(){
    return Padding(
      padding: EdgeInsets.only(top:70.0,left: 50.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          'Elige un producto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w900
          )
        ),
      ),
    );
  }

  Widget _product(){
    return Container(
      child: Column(
        children: [
          Text("Pet"),
          Image.asset("assets/pet.png",scale: 7.0,)
        ],
      ),
    );
  }

}