

import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/manejo_rutas.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ManejoRutas.rutaInicial,
      routes: ManejoRutas.manejoRutas(),
    );
  }
}