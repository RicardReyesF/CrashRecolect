import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final profileProvider= ProfileProvider();
  Profile profileModel=Profile();
  List<Marker> _mymarker=[];
  CameraPosition _initialPosition = CameraPosition(target: LatLng(19.294261,-99.7012547),zoom: 13.0);

  @override
  Widget build(BuildContext context) {
    final Profile equiData=ModalRoute.of(context).settings.arguments;
    if (equiData != null) {
      profileModel = equiData;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            padding: EdgeInsets.only(right: 370.0),
            onPressed:()=> Navigator.pushNamed(context,'profile',arguments: profileModel) 
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
            //onTap: ()=>Navigator.popAndPushNamed(context, 'add',arguments: municioModel.localizacion=tappedPoint.toString()),
            
          )    
        );
      });
      final value = tappedPoint.toString();
      final newtappedPoint = value.replaceAll("LatLng", "").replaceAll("(", "").replaceAll(" ", "").replaceAll(")", "");
      print("value: $newtappedPoint");
      profileModel.geo=newtappedPoint;
      print(profileModel.geo);
    }
}