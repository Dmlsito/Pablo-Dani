// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
