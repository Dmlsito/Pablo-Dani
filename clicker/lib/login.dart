// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datos.dart';
import 'main.dart';

class Login extends StatelessWidget {
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
      body: Container(child: LoginStates()),
    );
  }
}

class LoginStates extends StatefulWidget {
  @override
  LoginStatesState createState() => LoginStatesState();
}

class LoginStatesState extends State<LoginStates> {
  //Creamos el objeto db que extendera de la clase Mysql
  var db = new Mysql();
  //Esta es la variable donde vamos a guardar la informacion que nos devolvera la BDD, en este caso como prueba le pedimos el nombre
  var nombre = "";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FloatingActionButton(
            onPressed: () {
              setNombre();
            },
            child: Icon(Icons.abc)));
  }

//Esta funcion lo que va a hacer es hacer una consulta a la BBDD y l e
  void setNombre() {
    db.getConnection().then((conn) {
      //Esta va a ser nuestra consulta
      String sql = "SELECT Nombre FROM Usuarios";
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            nombre = row[0];
          });
        }
      });
    });
  }
}
