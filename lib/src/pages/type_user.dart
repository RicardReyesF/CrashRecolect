import 'dart:ui';

import 'package:flutter/material.dart';

class TypeUser extends StatelessWidget {
  const TypeUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _fondo(),
        Center(
          child: Table(
            children: [
              TableRow(
                children: [
                  _btn(context,"Quiero Comprar","newuserc",'assets/recolect.png'),
                  _btn(context,"Deseo vender","regis",'assets/vende.png')
                ]
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _btn(BuildContext context,String text,String ruta,String imagen){
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap:()=> Navigator.pushNamed(context,ruta),
        child: ClipRRect(
          child: BackdropFilter(
            filter:ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0) ,
            child: Container(
            height: 180.0,
            margin: EdgeInsets.all(15.0),
            
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7), 
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(  
              children: <Widget>[
              SizedBox(height: 15.0,),
              CircleAvatar(
                radius: 35.0,
                child: Image(image: AssetImage(imagen)),
            ),
            SizedBox(height: 40.0),
            Text(text,style: TextStyle(color: Colors.white,fontSize: 20.0),)
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
  Widget _fondo(){
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        )
    );
  }
}