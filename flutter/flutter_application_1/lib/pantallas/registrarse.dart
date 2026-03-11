

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_config.dart';

class Registrarse extends StatefulWidget{
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registrarse'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ingrese el nombre',
                ),
                validator: (value) => 
                value==null || value.isEmpty
                ? 'Ingrese el nombre'
                :null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Ingrese el correo'
                ),
                validator: (value) => 
                (value == null || value.isEmpty) ? 'Ingrese la contraseña' :
                (!value.contains('@') ? 'Necesita tener @' : 
                (!value.contains('.co')? 'Necesita terminar en .co o .com':null))
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Ingrese la contraseña'
                ),
                validator: (value) => 
                (value == null || value.isEmpty) ? 'Ingrese la contraseña' :
                (value.length<7 ? 'La contraseña debe tener minimo 8 caracteres' : null)
              ),
              ElevatedButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    bool respuesta = await ApiConfig.register({
                      "name":_nameController.text,
                      "email":_emailController.text,
                      "password":_passwordController.text
                    });
                    // print('listo');
                    if (respuesta){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(respuesta ? 'Registro exitoso' : 'Error al registrar'),
                          backgroundColor: respuesta ? Colors.green : Colors.red,
                        ),
                      );
                    }
                  }
                },child: Text('Enviar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}