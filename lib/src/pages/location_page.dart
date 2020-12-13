import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<Marker> _mymarker=[];
  CameraPosition _initialPosition = CameraPosition(target: LatLng(19.294261,-99.7012547),zoom: 13.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.only(right: 370.0),
            onPressed:()=> Navigator.pushNamed(context,'profile') 
            ),
        ],
      ),
       body: Stack(
         children: [
           _mapaPoint()
         ],
       ),
    );
  }

  Widget _mapaPoint(){
    return GoogleMap(   
              markers: Set.from(_mymarker),
              mapType: MapType.normal, 
              onMapCreated: (GoogleMapController controller) {},
              initialCameraPosition: _initialPosition,
              onTap: _handelTap,
              
            );

  }
  _handelTap(LatLng tappedPoint){
        setState(() {
          _mymarker=[]; 
          _mymarker.add(Marker(
            markerId: MarkerId(tappedPoint.toString()), 
            position: tappedPoint,
            
            
          )    
        );
      });
    }
}