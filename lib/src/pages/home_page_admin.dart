

import 'package:crash_recolect/src/pages/my_service.dart';
import 'package:crash_recolect/src/pages/map_page.dart';
import 'package:crash_recolect/src/pages/profileAdmin.dart';
import 'package:flutter/material.dart';


class HomePageAdm extends StatefulWidget {
  @override
  _HomePageAdmState createState() => _HomePageAdmState();
}

class _HomePageAdmState extends State<HomePageAdm> {
 int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar(){
     return BottomNavigationBar(
       backgroundColor: Colors.lightBlueAccent,
       unselectedItemColor: Colors.blueGrey,
       selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            title:Text('Añadir Producto')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            title:Text('Cuenta')
          )

        ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapPage();
      case 1: return MyServicePage();
      case 2: return ProfileAdminPage();
      default: return HomePageAdm();
    }
  }
}