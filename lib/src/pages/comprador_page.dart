import 'package:crash_recolect/src/models/user_model.dart';
import 'package:crash_recolect/src/provider/user_provider.dart';
import 'package:crash_recolect/src/widget/singup.dart';
import 'package:crash_recolect/src/widget/textNew.dart';
import 'package:crash_recolect/src/widget/userOld.dart';
import 'package:flutter/material.dart';


class NewUserC extends StatefulWidget {
  @override
  _NewUserCState createState() => _NewUserCState();
}

class _NewUserCState extends State<NewUserC> {
  UserModel userModel= new UserModel();
  final userProvider =  UserProvider();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
             Form(
               key: formKey,
               child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SingUp(),
                      TextNew(),
                    ],
                  ),
                  _nombreEmpresa(),
                  _newEmail(),
                  _passwordInput(),
                  _buttonNext(),
                  UserOld(),
                ],
            ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _nombreEmpresa(){
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
            initialValue: '',
            validator: (value){
              if(value.length < 3){
                return "Nombre muy corto";
              }else{
                return null;
              }
            },
            onSaved: (value)=>userModel.nom=value,

              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.lightBlueAccent,
                labelText: 'Nombre de la empresa',
                labelStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
    );
  }
  Widget _newEmail(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            initialValue: '',
            validator: (value){
              if(value.length < 5){
                return "Correo no valido";
              }else{
                return null;
              }
            },
            onSaved: (value)=> userModel.correo=value,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              labelText: 'E-mail',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
    );
  }
  Widget _passwordInput(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
            child: TextFormField(
              initialValue: '',
              validator: (value){
                if(value.length < 4 ){
                  return "Contraseña muy corta";
                }else{
                  return null;
                }
              },
              onSaved: (value)=> userModel.password = value,
              
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Contraseña',
                labelStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
    );
  }
  Widget _buttonNext(){
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          onPressed: (){
            userModel.role="admin";
            _submit();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Siguiente',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(){
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
    
    userProvider.crearUser(userModel);
    print(userModel.nom);
    print(userModel.correo);
    print(userModel.password);
    
    Navigator.popAndPushNamed(context, "login");
    }
    
  
}
