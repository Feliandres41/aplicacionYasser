import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiConfig {
  static String nombre = '';
  static String ip = "http://10.4.54.108:8000/api/login";
  static Future <bool> login(Map<String,dynamic> datos) async{
    final host = Uri.parse(ip);
    try{
      final respuesta = await http.post(
        host,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(datos)
      );
      if (respuesta.statusCode==200){
        final data = jsonDecode(respuesta.body);
        nombre = data['user']['name'];
        print('Logueo exitoso');

        return true;
      }else{
        print('Error');
        return false;
      }
    }catch(e){
      print('Error de conexion');
      return false;
    }
    
  }

}