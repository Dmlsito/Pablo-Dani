// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'datos.dart';
import 'main.dart';

class LoginStates extends StatefulWidget {
  @override
  LoginStatesState createState() => LoginStatesState();
}

class LoginStatesState extends State<LoginStates> {
  //Creamos el objeto db que extendera de la clase Mysql
  var db = new Mysql();
  //Esta es la variable donde vamos a guardar la informacion que nos devolvera
  //la BDD, en este caso como prueba le pedimos el nombre
  var nombre = "";
  @override
  Widget build(Object context) {
    return Scaffold(
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
        child: Column(
          children: [
            Container(
              child: Form(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      nombre = value.toString();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //setNombre();
            funcionRegistrar();
          },
          child: Icon(Icons.abc)),

      //Container(child: LoginStates()),
    );
  }

//Esta funcion lo que va a hacer es hacer una consulta a la BBDD y l e
  // void setNombre() {
  //   db.getConnection().then((conn) {
  //     //Esta va a ser nuestra consulta
  //     String sql = "SELECT Nombre FROM Usuarios";
  //     conn.query(sql).then((results) {
  //       for (var row in results) {
  //         setState(() {
  //           nombre = row[0];
  //         });
  //       }
  //     });
  //   });
  // }

  void comparaUsuario() {
    String nombreComparar;
    db.getConnection().then((conn) {
      String sqlConsulta = "SELECT Nombre FROM Usuarios";
      conn.query(sqlConsulta).then((results) {
        for (var row in results) {
          for (int i = 0; i > results.length; i++) {
            nombreComparar = row[i];
            if (nombre == nombreComparar) {
              funcionLogin();
            } else {
              setState(() {
                nombre = row[i];
              });
              funcionRegistrar();
            }
          }
        }
      });
    });
  }

  void funcionLogin() {}

  void funcionRegistrar() {
    db.getConnection().then((conn) {
      String sqlConsulta1 =
          "INSERT INTO usuarios (nombre) VALUES ('esto es una prueba')";
      conn.query(sqlConsulta1).then((results) {});
    });
  }
}
