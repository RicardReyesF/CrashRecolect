import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
Completer<GoogleMapController> _controller = Completer();
void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _map()
    );
  }

  Widget _map(){
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          onMapCreated: _onMapCreated,  
        ),
      ],
    );  
  }
}