
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
             SizedBox(height: 20.0,),
            _product1(),
             SizedBox(height: 20.0),
            _product2(),
             SizedBox(height: 20.0),
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
                padding: EdgeInsets.only(left:60.0,top:40.0),
                child: Column(
                  children: [
                    Text("Pet",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textfield(context);},
                      child: Image.asset("assets/pet.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:100.0,top:40.0),
                child: Column(
                  children: [
                    Text("Vidrio",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                    onTap: (){_textfield(context);},
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
                padding: EdgeInsets.only(left:60.0,top:40.0),
                child: Column(
                  children: [
                    Text("Latas",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                    onTap: (){_textfield(context);},
                    child: Image.asset("assets/lata.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:100.0,top:40.0),
                child: Column(
                  children: [
                    Text("Metal",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textfield(context);},
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
                padding: EdgeInsets.only(left:60.0,top:40.0),
                child: Column(
                  children: [
                    Text("Tapas",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textfield(context);},
                      child: Image.asset("assets/tapa.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:100.0,top:40.0),
                child: Column(
                  children: [
                    Text("Cobre",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textfield(context);},
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
                padding: EdgeInsets.only(left:60.0,top:40.0),
                child: Column(
                  children: [
                    Text("Baterias",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textfield(context);},
                      child: Image.asset("assets/bateria.png",scale: 7.0,),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left:100.0,top:40.0),
                child: Column(
                  children: [
                    Text("Otros",style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){_textother(context);},
                      child: Image.asset("assets/otro.png",scale: 7.0,),
                    )
                  ]
                )
          ),
        ],
    );
  }

  Future _textfield(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) => Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 180.0,
          child: Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:20),
                  width: 270.0,
                  height: 75.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "Precio",
                      icon: Icon(Icons.monetization_on_rounded),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                ),
              ), 
               RaisedButton(onPressed: ()=>Navigator.pushNamed(context,'service'),
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
    );
  }


  Future _textother(BuildContext context){
   return showDialog(
      context: context,
      builder: (context) => Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 250.0,
          child: Card(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:20),
                  width: 270.0,
                  height: 75.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "Nombre del producto",
                      icon: Icon(Icons.article_outlined),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top:20),
                  width: 270.0,
                  height: 75.0,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "Precio",
                      icon: Icon(Icons.monetization_on_rounded),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              
                RaisedButton(onPressed: ()=>Navigator.pushNamed(context,'service'),
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
    );
  }
}