

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_config.dart';

class PantallaInicial extends StatefulWidget{
  const PantallaInicial({super.key});

  @override
  State<PantallaInicial> createState() => _PantallaInicialState();
}

class _PantallaInicialState extends State<PantallaInicial> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _pwController = TextEditingController();
  @override
  void dispose(){
    super.dispose();
    _usuarioController.dispose();
    _pwController.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: 
      Column(
        children: [
          TextFormField(
            controller: _usuarioController,
            decoration: InputDecoration(
              labelText: 'Ingresa el correo'
            ),
            validator: (value)=>
              (value == null || value.isEmpty) ? 'Ingrese el correo' :
              (!value.contains('@') ? 'Necesita tener @' : null)
          ),
          TextFormField(
            controller: _pwController,
            decoration: InputDecoration(
              labelText: 'Ingresa la contraseña'
            ),
            validator: (value)=>
              value==null || value.isEmpty
              ? 'Ingrese la contraseña'
              : null
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                bool respuesta = await ApiConfig.login({
                  "email": _usuarioController.text,
                  "password": _pwController.text
                });

                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text(respuesta ? 'Login exitoso' : 'Credenciales incorrectas'),
                //     backgroundColor: respuesta ? Colors.green : Colors.red,
                //   ),
                // );
                // respuesta==true
                // ? Navigator.pushNamed(context, '/logueado')
                // : null;
                if(!respuesta){
                  //mensaje con boton para cerrar B_02
                  showDialog(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: const Text("Credencial incorrecta"),
                      content: const Text("¿Tienes una cuenta?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Si"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/register'),
                          child: const Text("No"),
                        ),
                      ],
                    ),
                  );

                }else{
                  Navigator.pushNamed(context, '/home');
                }
              }
              
            },child: Text('Iniciar sesión'),

          )
        ],
      ))
    );
  }
}