// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ClickerMain extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
  @override
  Widget build(BuildContext context) {
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
              title: Text("Hola pablo"),
              leading: Icon(Icons.integration_instructions),
            ),
            ListTile(
              title: Text("Item 2"),
              leading: Icon(Icons.integration_instructions),
            ),
            ListTile(
              title: Text("Item 3"),
              leading: Icon(Icons.integration_instructions),
            ),
            ListTile(
              title: Text("Item 1"),
              leading: Icon(Icons.integration_instructions),
            ),
          ])),
      appBar: AppBar(
          title: Center(child: Text("Clicker", textAlign: TextAlign.center))),

      //
      //
      body: Center(
        child: Column(
          children: [
            //Container with world´s title
            Container(
              alignment: Alignment.topRight,
              child: Text("Mundo 1", style: TextStyle(fontSize: 25)),
            ),
            //Container with monster´s image
            Container(
              margin: EdgeInsets.only(top: 50),
              child: imagenClick(),
            ),
            //Container with life bar
            Container(
                margin: EdgeInsets.only(top: 8),
                child: Text("Barra de vida", style: TextStyle(fontSize: 25))),
            //Container with coins and amount
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 60),
              child: Text("Monedas: ", style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),

      //Footer
      floatingActionButton: Container(
        child: Scroll(),
      ),
    );
  }
}

//Clase scroll
class Scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

//Clase imagen
class imagenClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {},
        // ignore: sized_box_for_whitespace
        child: Container(
          // ignore: prefer_const_constructors
          child: Image.asset('assets/monstruo.png'),
          height: 300,
          width: 300,
        ),
      ),
    ]);
  }
}
