import 'dart:async';

import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
  
}

class _MapPageState extends State<MapPage> {
  final profileProvider= ProfileProvider();
  Profile profileModel=Profile();
  LatLng geo;
  LatLng mark;
  double zoom;
  List<Marker> _mymarker =[];
  
//Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final Profile equiData=ModalRoute.of(context).settings.arguments;
    
    if(equiData != null){
      profileModel = equiData;
      final lonlat=profileModel.geo.split(",");
      final lat=double.parse(lonlat[0]);
      final long =double.parse(lonlat[1]);
       geo = LatLng(lat,long);
       mark=LatLng(lat,long);
       zoom=18.0;
    
    }else{
      
        final double lat=19.294099;
        final double long=-99.7012551;
        //
        final double lat1=0;
        final double long1=0;
        geo = LatLng(lat,long);
        mark = LatLng(lat1,long1);
        zoom=12.0;
    }
  
  /*
    if (equiData != null) {
      profileModel = equiData;
    }
  */
    return Scaffold(
      body: _map()
    );
  }
  



  Widget _map(){
    
CameraPosition _initialPosition = CameraPosition(target: geo, zoom: zoom );    
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              _mymarker.add(
                Marker(
                  markerId: MarkerId(""),
                  position: mark,
                  infoWindow: InfoWindow(title: "${profileModel.nom}" ,snippet: "${profileModel.location}")
        ),
      );
    });
          },
          initialCameraPosition: _initialPosition,
           myLocationEnabled: true,
           padding: EdgeInsets.only(top: 100.0,),
           myLocationButtonEnabled: true,
           markers: Set.from(_mymarker),
           
        )
      ],
    );  
  }
  
  
  
}