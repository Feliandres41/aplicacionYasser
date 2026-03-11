import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiConfig {
  static String nombre = '';
  static String ip = "http://10.4.57.92:8000/api";
  static Future <bool> login(Map<String,dynamic> datos) async{
    final host = Uri.parse("$ip/login");
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
  static Future<bool> register(Map<String, dynamic> datosRegistro) async {
    final host = Uri.parse("$ip/register");

    try {
      final respuesta = await http.post(
        host,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datosRegistro),
      );

      if (respuesta.statusCode == 200 || respuesta.statusCode == 201) {
        print('Registro exitoso');
        return true;
      } else {
        print('Error en registro: ${respuesta.body}');
        return false;
      }
    } catch (e) {
      print('Error de conexión: $e');
      return false;
    }
  }

}