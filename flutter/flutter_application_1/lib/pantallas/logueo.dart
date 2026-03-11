

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_config.dart';

class Logueo extends StatelessWidget{
  const Logueo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
       child: Text('Bienvenidos ${ApiConfig.nombre}'),
      ),
    );
  }
}