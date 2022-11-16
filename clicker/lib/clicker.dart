// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'monstruo.dart';

class ClickerMain extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

List<monstruo> listaMonstruos = [
  monstruo(
    nombre: "Pablo",
    vida: 1000,
    imagenRuta: "assets/pequeñoCola1.png",
    identificador: 1,
  ),
  monstruo(
    nombre: "Daniel",
    vida: 2000,
    imagenRuta: "assets/monstruo2.png",
    identificador: 2,
  ),
  monstruo(
    nombre: "Nelson",
    vida: 4000,
    imagenRuta: "assets/plantaCarnivora3.png",
    identificador: 3,
  ),
  monstruo(
    nombre: "Laura",
    vida: 8000,
    imagenRuta: "assets/monstruo1Mundo2.png",
    identificador: 4,
  ),
  monstruo(
    nombre: "Hugo",
    vida: 16000,
    imagenRuta: "assets/monstruo2Mundo2.png",
    identificador: 5,
  ),
  monstruo(
    nombre: "Adrian",
    vida: 32000,
    imagenRuta: "assets/monstruo3Mundo2.png",
    identificador: 6,
  ),
  monstruo(
    nombre: "Oscar",
    vida: 64000,
    imagenRuta: "assets/monstruo1Mundo3.png",
    identificador: 7,
  ),
  monstruo(
    nombre: "Alfonso",
    vida: 128000,
    imagenRuta: "assets/monstruo2Mundo3.png",
    identificador: 8,
  ),
  monstruo(
    nombre: "Suso",
    vida: 256000,
    imagenRuta: "assets/monstruo3Mundo3.png",
    identificador: 9,
  ),
];
// Vida inicial
int vida = listaMonstruos[contador].vida;
// Ruta de imagen inicial
String rutaMonstruo = listaMonstruos[contador].imagenRuta;
int contador = 0;
int monedas = 0;
int mundo = 1;

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
  @override
  Widget build(BuildContext context) {
    void vidaResta() {
      // Resto uno de vida y sumo 5 monedas
      setState(() {
        vida = vida - 100;
        print(vida);
        monedas = monedas + 5;
        print(monedas);

        if (vida == 0) {
          // Cuento los monstruos que mueren
          contador++;
          vida = listaMonstruos[contador].vida;
          rutaMonstruo = listaMonstruos[contador].imagenRuta;
          print(rutaMonstruo);

          // Si han muerto 3 monstruos, el mundo suma 1 porque pasamos al siguiente mundo
          if (contador == 3) {
            mundo++;
            contador = 0;
          }
        }
      });
    }

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
              child: Column(children: [
                InkWell(
                  onTap: () {
                    vidaResta();
                    // Este print es para probar
                    print("He pulsado");
                  },
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    // ignore: prefer_const_constructors
                    child: Image.asset(rutaMonstruo),
                    height: 300,
                    width: 300,
                    //
                  ),
                ),
              ]),
            ),
            //Container with life bar
            Container(
              // margin: EdgeInsets.only(top: 8),
              // child: Text("Barra de vida", style: TextStyle(fontSize: 25))
              child: LinearProgressIndicator(
                // value: vida;
                backgroundColor: Colors.red,
              ),
            ),
            //Container with coins and amount
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 20),
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
