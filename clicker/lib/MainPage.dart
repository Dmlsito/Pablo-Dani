// ignore_for_file: prefer_const_constructors

import "Usuario.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mysql1/mysql1.dart';
// import 'package:http/http.dart' as http;

import 'main.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nombre = TextEditingController();
    final TextEditingController contrasena = TextEditingController();

    GlobalKey formKey = GlobalKey<FormState>();

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondoPrueba.jpg"), fit: BoxFit.cover)),
            child: Scaffold(
                //Hacemos transparante el fondo para que se muestre la imagen
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                    //Borde redondeado
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: ListView(children: [
                      DrawerHeader(
                        child: Container(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.home,
                              size: 70,
                            )),
                      ),
                      ListTile(
                        title: Text("Ranking"),
                        leading: Icon(Icons.integration_instructions),
                      ),
                      ListTile(
                        title: Text("Contacto DEVS"),
                        leading: Icon(Icons.integration_instructions),
                      ),
                    ])),
                body: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Text("Bienvenido",
                                style: TextStyle(fontSize: 40))),
                        //Introduccion nombre
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/imagenes/Marco.png"),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              )),
                          margin: EdgeInsets.only(left: 80, right: 80, top: 80),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            //Recogemos lo que se escribe en la variable nombre
                            controller: nombre,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return "Ingrese un nombre porfavor";
                              }
                              return null;
                            },
                          ),
                        ),
                        //Introduccion contraseña
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("")),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                              )),
                          margin: EdgeInsets.only(left: 80, right: 80, top: 50),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                   return "Es necesario ingresar una contraseña";
                                }
                                return null;
                                
                              },
                              controller: contrasena),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 40.0,
                            color: Colors.lightBlue,
                            onPressed: () {
                              login(context, nombre, contrasena);
                            },
                            child: Text("Login",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 40.0,
                            color: Colors.lightBlue,
                            onPressed: () {
                              register(context);
                            },
                            child: Text("Register",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                //Container(child: LoginStates()),
                )));
  }

  void register(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/Login",
    );
  }
   void login(BuildContext context, final TextEditingController nombre,
      final TextEditingController contrasena) {
    Navigator.of(context).pushNamed("/Clicker",
        arguments: Usuario(nombre: nombre.text, contrasena: contrasena.text));
  }
}