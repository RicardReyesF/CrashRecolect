import 'package:crash_recolect/src/pages/home_page.dart';
import 'package:crash_recolect/src/pages/map_page.dart';
import 'package:crash_recolect/src/pages/view_page.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget { 
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  int currentIndex=0;

  Widget build(BuildContext context) {
    
      return Scaffold(
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
