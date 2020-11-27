import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
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
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            _tarjetas()
          ],
        ),
      )
    );
  }

  Widget _tarjetas(){
    return  Container(
      padding: EdgeInsets.only(top: 10.0),
      width: 400.0,
      height: 600.0,
      child: Swiper(
      
        itemBuilder: (BuildContext context, int index){
          return _card();
        },
        itemCount: 3,
        control: SwiperControl(),
        
      ),
    );
    
  }

  Widget _card(){
    return Card(
      child: Column(
        children: [
          Container(
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png"),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(40),
            title: Text('Nombre de la empresa'),
            subtitle: Text('Caracteristicas'),
          )
        ],
      ),
    );
  }
}