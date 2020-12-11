
import 'package:crash_recolect/src/models/product_model.dart';
import 'package:crash_recolect/src/provider/product_provider.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final formKey = GlobalKey<FormState>();
  final productProvider = ProductProvider();
  Product productModel = new Product();
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
          ),
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
                      onTap: (){_textfield(context,"Pet","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643480/yz78mamzhpo980lrlodu.png");},
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
                    onTap: (){_textfield(context,"Vidrio","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643404/redo38vnry41iwmk2tht.png");},
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
                    onTap: (){_textfield(context,"Latas","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643505/yitrpuuctjpno1esch3r.png");},
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
                      onTap: (){_textfield(context,"Metal","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643497/ffhufqc3swodgmuz2wga.png");},
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
                      onTap: (){_textfield(context,"Tapas","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643471/bbyuggwkhpmrhzjyrd4c.png");},
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
                      onTap: (){_textfield(context,"Cobre","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643541/flpnrbi1kouzrvemhtpp.png");},
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
                      onTap: (){_textfield(context,"Baterias","https://res.cloudinary.com/dmotjftjo/image/upload/v1607643552/fbgcgouv853ycqx8xwb5.png");},
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
                      onTap: (){
                        _textother(context,"https://res.cloudinary.com/dmotjftjo/image/upload/v1607643490/sciyuegews5pitxpn3pi.png");
                      },
                      child: Image.asset("assets/otro.png",scale: 7.0,),
                      
                    )
                  ]
                )
          ),
        ],
    );
  }

  Future _textfield(BuildContext context,String nom,String image){
    productModel.nomProduct=nom;
    productModel.image=image;
    return showDialog(
      context: context,
      builder: (context) => Align(
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "Precio",
                        icon: Icon(Icons.monetization_on_rounded),
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    initialValue: '',
                    validator: (value){
                      if(value.length < 0){
                        return "Ingresa un precio";
                      }else {
                        return null;
                      }
                    },
                    onSaved: (value)=> productModel.price=value,
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


  Future _textother(BuildContext context,String image){
    productModel.image=image;
   return showDialog(
      context: context,
      builder: (context) => Align(
        alignment:Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top:20,),
          width: 300.0,
          height: 250.0,
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
                      initialValue: '',
                      validator: (value){
                        if(value.length < 3){
                          return "Corto";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        counterText: "Nombre del producto",
                        icon: Icon(Icons.article_outlined),
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    onSaved: (value)=> productModel.nomProduct=value,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top:20),
                    width: 270.0,
                    height: 75.0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "Precio",
                        icon: Icon(Icons.monetization_on_rounded),
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    initialValue: '',
                    validator: (value){
                      if(value.length<3){
                        return "Cadena corta";
                      }else{
                        return null;
                      }
                    },
                    onSaved: (value)=>productModel.price=value,
                  ),
                ),
                
                  RaisedButton(onPressed: ()=>_submit1(),
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

  void _submit(){
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
   productProvider.crearProduct(productModel);
   
   Navigator.popAndPushNamed(context, 'service');
  }

  void _submit1(){
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
   productProvider.crearProduct(productModel);
   
   Navigator.popAndPushNamed(context, 'service');
  }
}