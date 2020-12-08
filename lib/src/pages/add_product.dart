import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         _fondo(),
         SingleChildScrollView(
           child: Column(
           children: [
             _letras(),
            _letras1(),
            _product(),
            _product1(),
            _product2(),
            _product3(),

           ],
          )
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
    return  Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left:80.0,top:40.0),
                child: Column(
                  children: [
                    Text("Pet",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/pet.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:120.0,top:40.0),
                child: Column(
                  children: [
                    Text("Vidrio",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                    onTap: (){},
                    child: Image.asset("assets/vidrio.png",scale: 7.0,),
                    )
                  ]
                )
          ),
        ],
    );
  }
  Widget _product1(){
    return  Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left:80.0,top:40.0),
                child: Column(
                  children: [
                    Text("Latas",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                    onTap: (){},
                    child: Image.asset("assets/lata.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:120.0,top:40.0),
                child: Column(
                  children: [
                    Text("Metal",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/metal.png",scale: 7.0,),
                    )
                  ]
                )
          ),
        ],
    );
  }
  Widget _product2(){
    return  Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left:80.0,top:40.0),
                child: Column(
                  children: [
                    Text("Tapas",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/tapa.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:120.0,top:40.0),
                child: Column(
                  children: [
                    Text("Cobre",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/cobre.png",scale: 7.0,),
                    )
                  ]
                )
          ),
        ],
    );
  }

  Widget _product3(){
    return  Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left:80.0,top:40.0),
                child: Column(
                  children: [
                    Text("Baterias",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/bateria.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:120.0,top:40.0),
                child: Column(
                  children: [
                    Text("Otros",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/otro.png",scale: 7.0,),
                    )
                  ]
                )
          ),
        ],
    );
  }
}