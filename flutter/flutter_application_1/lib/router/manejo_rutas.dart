

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/pantallas/logueo.dart';
import 'package:flutter_application_1/pantallas/pantalla_inicial.dart';
import 'package:flutter_application_1/pantallas/registrarse.dart';

class ManejoRutas {
  static String rutaInicial = '/';
  static final rutas= <Models>[
    Models(
      nombre: 'pagina inicial', 
      ruta: '/', 
      pantallas: PantallaInicial()
    ),
    Models(
      nombre: 'pagina de registro', 
      ruta: '/register', 
      pantallas: Registrarse()
    ),
    Models(
      nombre: 'pagina de logueado', 
      ruta: '/home', 
      pantallas: Logueo()
    )
  ];
  static Map<String,WidgetBuilder> manejoRutas(){
    Map<String,WidgetBuilder> rutaTomar={};
    for (final i in rutas){
      rutaTomar[i.ruta]=(context)=>i.pantallas;
    }
    return rutaTomar;
  }
}