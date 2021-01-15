import 'dart:convert';
import 'package:crash_recolect/src/models/vendedor_model.dart';
import 'package:http/http.dart' as http;


class VendedorProvider{

  final String _url = 'https://crashrecolect-default-rtdb.firebaseio.com/';

  Future<bool> crearVendedor( VendedorModel vendedorModel) async {
    final url ='$_url/Vendedores.json';

    final resp = await http.post(url,body: vendedorModelToJson(vendedorModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<VendedorModel>> cargarVendedor() async {
    final url ='$_url/Vendedores.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);

    final List<VendedorModel> vendedor = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,ven) { 

      final venTemp= VendedorModel.fromJson(ven);
      venTemp.id= id;

      vendedor.add(venTemp);

    });


    return vendedor;
  }

  Future<int> borrarVen(String id) async {
    final url ='$_url/Vendedores/$id.json';

    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<bool> editarVendedor(VendedorModel vendedorModel) async {
    final url ='$_url/Vendedores/${vendedorModel.id}.json';

    final resp = await http.put(url,body: vendedorModelToJson(vendedorModel));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
  
}