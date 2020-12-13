import 'package:crash_recolect/src/pages/add_product.dart';
import 'package:crash_recolect/src/pages/location_page.dart';
import 'package:crash_recolect/src/pages/my_service.dart';
import 'package:crash_recolect/src/pages/home_page_admin.dart';
import 'package:crash_recolect/src/pages/information_add.dart';
import 'package:crash_recolect/src/pages/map_page.dart';
import 'package:crash_recolect/src/pages/home_page.dart';
import 'package:crash_recolect/src/pages/login.page.dart';
import 'package:crash_recolect/src/pages/newuser.page.dart';
import 'package:crash_recolect/src/pages/profileAdmin.dart';
import 'package:crash_recolect/src/pages/type_user.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'homeadm',
      routes: {
        'home'     : (BuildContext context) => HomePage(),
        'homeadm'  : (BuildContext context) => HomePageAdm(),
        'map'      : (BuildContext context) => MapPage(),
        'login'    : (BuildContext context) => LoginPage(),
        'regis'    : (BuildContext context) => NewUser(),
        'typeuser' : (BuildContext context) => TypeUser(),
        'newuserc' : (BuildContext context) => NewUserC(),
        'product'  : (BuildContext context) => AddProductPage(),
        'service'  : (BuildContext context) => MyServicePage(),
        'location' : (BuildContext context) => LocationPage(),
        'profile'  : (BuildContext context) => ProfileAdminPage(),
      },
      debugShowCheckedModeBanner: false,      
    );
  }
}