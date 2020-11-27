

import 'package:crash_recolect/src/pages/map_page.dart';
import 'package:crash_recolect/src/pages/view_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            icon: Icon(Icons.commute_outlined),
            title:Text('Consulta')
          )
        ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return MapPage();
      case 1: return ViewPage();
      default: return HomePage();
    }
  }
}