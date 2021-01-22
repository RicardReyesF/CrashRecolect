import 'package:crash_recolect/src/provider/user_Auth.dart';
import 'package:crash_recolect/src/widget/first.dart';
import 'package:crash_recolect/src/widget/textLogin.dart';
import 'package:crash_recolect/src/widget/verticalText.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
 String pass="";
 String email="";
GlobalKey<FormState> formKey = GlobalKey<FormState>();
final userAuthProvider = UsuarioAuth();
final databaseReference = FirebaseDatabase.instance.reference();
FirebaseUser currentUser=FirebaseAuth.instance.currentUser;
String uID=currentUser.tenantId;

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
          keyboardType: TextInputType.emailAddress,
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
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((UserCredential u) {
      FirebaseDatabase.instance
          .reference()
          .child('User')
          .child(u.user.uid)
          .once()
          .then((DataSnapshot data) {
           String role= data.value['role'];
           //String correo= data.value['correo'];
           //String passw= data.value['password'];
           if(role=='admin'){ 
              Navigator.pushReplacementNamed(context, 'homeadm');
           } else{
             if(role=='user')
              Navigator.pushReplacementNamed(context, 'home');
           }
          });
        });
  }
}


  