import 'package:crash_recolect/src/widget/first.dart';
import 'package:crash_recolect/src/widget/textLogin.dart';
import 'package:crash_recolect/src/widget/verticalText.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
 String pass="";
 String email="";
final formKey = GlobalKey<FormState>();
final databaseReference = FirebaseDatabase.instance.reference();

class _LoginPageState extends State<LoginPage> {
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
              key:formKey,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    VerticalText(),
                    TextLogin(),
                  ]),
                  _inputEmail(),
                  _inputPassword(),
                  _buttonLogin(),
                  FirstTime(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _inputEmail(){
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.white,
            labelText: 'Usuario o E-mail',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
          validator: (value){
            if(value.length < 1 ){
              return "nada de nada";
            }
              return null;
          },
          onSaved: (value) => email = value,
        ),
      ),
    );
  }

  Widget _inputPassword(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
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
          validator: (value){
            if(value.length < 1 ){
              return "nada de nada";
            }
              return null;
          },
          onSaved: (value)=>pass=value,
        ),
      ),
    );
  }

  Widget _buttonLogin(){
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: ()=> readData(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'OK',
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

  Future<void> readData() async {
    if (!formKey.currentState.validate()) return;
    print('Todo ok');
    formKey.currentState.save();
    databaseReference.child('User').once().then((DataSnapshot snapshot) {
      String role = snapshot.value['role'];
      String correo = snapshot.value['correo'];
      String password = snapshot.value['password'];
      print(role);
      print(correo);
      print(password);
      if (role=="admin" && email==correo && pass== password) {
          Navigator.pushReplacementNamed(context,"homeadm");
        }else{
          if(role=="user"){
          Navigator.pushReplacementNamed(context,"home");  
          }
        }
      print(snapshot.value);
      print(snapshot.key);
    });
  }
}