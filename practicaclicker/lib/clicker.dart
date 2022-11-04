// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

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
      //Explicacion: ya teniendo controlado el index de los items del navigationsBar he creado una lista de Widgets, los cuales estan definidos abajo,
      //entonces, imaginemonos que queremos utilizar el item1, lo unico que tenemos que hacer el clickar en el item1
      //se guardara el index de este en la variable indexItem dsp se llama en un container a la lista pasandole el indexItem, esto se correspondera al Widget Item1
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                "Mundo 1",
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              child: imagenClick(),
            ),
            Container(child: Text("Barra de vida")),
            Container(
              child: Text("Monedas"),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        child: Scroll(),
      ),
    );
  }
}

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

class imagenClick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {},
        child: Container(
          // ignore: prefer_const_constructors
          child: Image.asset('images/monstruo.png'),
          height: 100,
          width: 100,
        ),
      ),
    ]);
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