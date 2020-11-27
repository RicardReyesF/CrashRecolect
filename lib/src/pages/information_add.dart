import 'package:crash_recolect/src/widget/buttonNewUser.dart';
import 'package:crash_recolect/src/widget/button_next.dart';
import 'package:crash_recolect/src/widget/name_factory.dart';
import 'package:crash_recolect/src/widget/newEmail.dart';
import 'package:crash_recolect/src/widget/newName.dart';
import 'package:crash_recolect/src/widget/password.dart';
import 'package:crash_recolect/src/widget/producto.dart';
import 'package:crash_recolect/src/widget/singup.dart';
import 'package:crash_recolect/src/widget/textNew.dart';
import 'package:crash_recolect/src/widget/userOld.dart';
import 'package:flutter/material.dart';


class NewUserC extends StatefulWidget {
  @override
  _NewUserCState createState() => _NewUserCState();
}

class _NewUserCState extends State<NewUserC> {
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
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                NameF(),
                NewEmail(),
                PasswordInput(),
                ButtonNext(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
