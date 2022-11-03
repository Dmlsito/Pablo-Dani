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
  int num = 50;
  int indexItem = 0;
  //Lista de los items
  List<Widget> items = [
    Item1(),
    Item2(),
    Item3(),
  ];
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
      body: Container(child: items[indexItem]),
      //Explicacion: el currentIndex  es el index que representara cada BottomNavigationBarItemm de la lista items, como nosotros queremos
      // que al clickar en un item "lo tengamos", tenemos que poder gestionar ese currentIndex, para eso creamos una variable llamda indexItem,
      //con el metodo onTap decimos que el index del item que estemos clicando se guarde en esa variable y luego fuera el onTap decimo que el currentIndex es igual a indexItem

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexItem,
        onTap: (index) {
          setState(() {
            indexItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Item1"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Item2"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Item3"),
        ],
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Item1"));
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Item2"));
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Item3"));
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
