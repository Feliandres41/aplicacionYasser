

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pantallas/logueo.dart';
import 'package:flutter_application_1/pantallas/pantalla_inicial.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>PantallaInicial(),
        '/logueado':(context)=>Logueo()
      },
    );
  }
}