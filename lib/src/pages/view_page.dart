import 'package:crash_recolect/src/models/profile_model.dart';
import 'package:crash_recolect/src/pages/profileAdmin.dart';
import 'package:crash_recolect/src/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
  final profileProvider = new ProfileProvider();
  Profile profileModel= Profile();
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
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: profileProvider.cargarProfile(),
      builder: (BuildContext context, AsyncSnapshot<List<Profile>>snapshot){
        if(snapshot.hasData){
          final profile=snapshot.data;
          return Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: _screenSize.width * 0.8,
            itemHeight: _screenSize.height * 0.7,
            itemCount: profile.length,
            itemBuilder: (context,i) => _crearItem(profile[i],context)  
          );
          
        }else{
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }  
    );
    
  }

  Widget _crearItem(Profile profileModel, BuildContext context){
    return Card( 
      child: Column(
        children: [
          ClipRRect(
                child: FadeInImage(
                  placeholder: AssetImage("assets/no-image.png"),
                  image: NetworkImage(profileModel.image)
                ),
              ),
              Container(
                height: 50.0,
              ),
               Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Row(
                      children: [
                        Icon(Icons.assignment_ind_sharp,color: Colors.grey,),
                        Text("  ""${profileModel.nom}",style: TextStyle(fontSize: 25.0),)
                      ],  
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      children: [
                        GestureDetector(
                        onTap: ()=>Navigator.pushNamed(context,"map",arguments: profileModel),
                        child: Row(children: [
                          Icon(Icons.gps_fixed_outlined,color: Colors.grey,),
                          Text("  ""${profileModel.location}",style: TextStyle(fontSize: 25.0),)
                      
                        ],),  
                        )
                        ],
                    ),
                  ],
                ),
              
          
        ],
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