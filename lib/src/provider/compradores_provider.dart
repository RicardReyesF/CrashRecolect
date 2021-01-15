import 'dart:convert';
import 'package:crash_recolect/src/models/comprador_model.dart';
import 'package:http/http.dart' as http;


class CompradorProvider{

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearComprador( CompradorModel compradorModel) async {
    final url ='$_url/Compradores.json';

    final resp = await http.post(url,body: compradorModelToJson(compradorModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<CompradorModel>> cargarComprador() async {
    final url ='$_url/Compradores.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<CompradorModel> comprador = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,com) { 

      final comTemp= CompradorModel.fromJson(com);
      comTemp.id= id;

      comprador.add(comTemp);

    });


    return comprador;
  }

  Future<int> borrarVen(String id) async {
    final url ='$_url/Compradores/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarVendedor(CompradorModel compradorModel) async {
    final url ='$_url/Compradores/${compradorModel.id}.json';

    final resp = await http.put(url,body: compradorModelToJson(compradorModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
  
}