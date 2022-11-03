// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables

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
  int contador = 100;
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
    );
  }

  void disminuir() {
    setState(() {
      contador--;
    });
  }
}


//Lo que teniamos antes aqui comentado -> 
//  body: Center(
//         child: Column(children: [
//           InkWell(
//             onTap: () {
//               disminuir();
//             },
//             child: Container(
//               // ignore: prefer_const_constructors
//               child: FadeInImage(
//                   image: NetworkImage(
//                       'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515__340.png'),
//                   height: 100,
//                   width: 100,
//                   placeholder: NetworkImage(
//                       'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515__340.png')),
//             ),
//           ),
//           Text(contador.toString()),
//         ]),
//       ),