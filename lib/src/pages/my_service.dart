import 'package:crash_recolect/src/models/product_model.dart';
import 'package:crash_recolect/src/provider/product_provider.dart';
import 'package:flutter/material.dart';

class MyServicePage extends StatefulWidget {
  const MyServicePage({Key key}) : super(key: key);

  @override
  _MyServicePageState createState() => _MyServicePageState();
}

class _MyServicePageState extends State<MyServicePage> {
  final productProvider= ProductProvider();
  Product productModel = new Product();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Stack(
       children: [
         _fondo(),
         SingleChildScrollView(
           child: Column(
             children: [
               _letras(),
               Container(
                 width: 500.0,
                 height: 800.0,
                 child:_crearlistado(),
               )
             ],
           ),
         )
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

    Widget _crearlistado(){
    return FutureBuilder(
      future: productProvider.cargarProducto(),
      builder: (BuildContext context,AsyncSnapshot<List<Product>>snapshot){
        if (snapshot.hasData) {
          final productos= snapshot.data; 
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context,i) => _crearItem(productos[i],context),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(), 
          );
        }
      }
    );
  }
  Widget _crearItem(Product productModel,BuildContext context){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed:(direction){
        productProvider.borrarPro(productModel.id);
      } ,
          child: Container(
            decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blueGrey, Colors.lightBlueAccent]
                      ),
                    ),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration:BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blueGrey, Colors.lightBlueAccent]
                      ),
                    ),
                    child: FadeInImage(
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage(productModel.image),
                        width: double.infinity,
                        height: 75.0,

                        ),
                  ),
                   Container(
                     decoration:BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.blueGrey, Colors.lightBlueAccent]
                      ),
                    ),
                     child: ListTile(
                          title: Text('${productModel.nomProduct}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 25.0)),
                            subtitle: Text('Precio: ${productModel.price}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20.0)),
                            onTap: ()=> _textfield(context,productModel),
                            
                          ),
                   ),
                  ],
                ), 
              ),
          ), 
    );
  }

  Future _textfield(BuildContext context,Product productModel){
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
                    initialValue: productModel.price,
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
                 RaisedButton(onPressed: ()=>_submit(context,productModel),
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
  void _submit(BuildContext context,Product productModel){
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
    print(productModel.image);
    print(productModel.nomProduct);
    print(productModel.id);
   productProvider.editarProduct(productModel);
   
   Navigator.popAndPushNamed(context, 'service');
  }

}