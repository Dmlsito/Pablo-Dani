// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Usuario.dart';
import 'main.dart';

class MainPage extends StatelessWidget {
  String nombre = '';
  String contrasena = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Pruebagif.gif"),
                  fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 100),
                          child: Text("Bienvenido",
                              style: TextStyle(fontSize: 40)),
                        ),
                        Container(
                          height: 50,
                          margin:
                              EdgeInsets.only(top: 100, left: 80, right: 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nombre",
                            ),
                            onSaved: (value) {
                              nombre = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: "Contraseña"),
                            onSaved: (value) {
                              nombre = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: OutlinedButton(
                                onPressed: () {
                                  login(context, nombre, contrasena);
                                },
                                child: Text("Login",
                                    style: TextStyle(fontSize: 20)))),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: OutlinedButton(
                                onPressed: () {
                                  register(context);
                                },
                                child: Text("Register",
                                    style: TextStyle(fontSize: 20)))),
                      ],
                    )),
              ))),
    );
  }

  login(BuildContext context, String nombre, String contrasena) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushNamed("/Clicker",
          arguments: Usuario(nombre: nombre, contrasena: contrasena));
    }
  }

  register(BuildContext context) {
    Navigator.of(context).pushNamed("/Register");
  }
}
