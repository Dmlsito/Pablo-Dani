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
    vida: 1000,
    imagenRuta: "assets/monstruo3Mundo2.png",
    identificador: 6,
  ),
  monstruo(
    nombre: "Oscar",
    vida: 640,
    imagenRuta: "assets/monstruo1Mundo3.png",
    identificador: 7,
  ),
  monstruo(
    nombre: "Alfonso",
    vida: 1280,
    imagenRuta: "assets/monstruo2Mundo3.png",
    identificador: 8,
  ),
  monstruo(
    nombre: "Suso",
    vida: 2560,
    imagenRuta: "assets/monstruo3Mundo3.png",
    identificador: 9,
  ),
];
List<String> listaMundos = [
  "assets/fondoPrueba.jpg",
  "assets/dragon.png",
  "assets/fondoPrueba2.jpg"
];
// Vida inicial
int vida = listaMonstruos[contador].vida;
int indexImagen = 0;

double v = 12;
// Ruta de imagen inicial
String rutaMonstruo = listaMonstruos[contador].imagenRuta;
// Contador para cambiar de monstruo
int contador = 0;
int monedas = 0;
int mundo = 1;
int golpe = 10;
int contadorMundos = 0;

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
//Variables para cambiar de monstruo
  int vida = listaMonstruos[contador].vida;

  @override
  Widget build(BuildContext context) {
    void vidaResta() {
      // Resto uno de vida y sumo 5 monedas
      setState(() {
        vida = vida - 400;
        print(vida.toString());
        monedas = monedas + 5;
        print(monedas.toString());

        if (vida < 0) {
          contador++;
          vida = listaMonstruos[contador].vida;
          rutaMonstruo = listaMonstruos[contador].imagenRuta;
          //Controlamos que si ha matado mas de 3 mundos pero menos de 6 el mundo se actualizara
          if (contador >= 3 && contador <= 6) {
            indexImagen = 1;
          }
          if (contador >= 6) {
            indexImagen = 2;
          }
        }
      });
    }

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listaMundos[indexImagen]),
                    fit: BoxFit.cover)),
            child: Scaffold(
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
                  title: Center(
                      child: Text("Clicker", textAlign: TextAlign.center))),

              //
              //
              body: Center(
                child: Column(
                  children: [
                    //Container with world´s title
                    Container(
                      alignment: Alignment.topRight,
                      child: Text("Mundo 1",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    //Container with monster´s image
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            vidaResta();
                            // Este print es para probar
                            print("Se resta la vida");
                          },
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            margin: EdgeInsets.only(left: 50),
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

                    Container(
                      width: 300,
                      height: 20,
                      // margin: EdgeInsets.only(top: 8),
                      // child: Text("Barra de vida", style: TextStyle(fontSize: 25))
                      child: LinearProgressIndicator(
                        // value: vida;
                        backgroundColor: Colors.green,
                        value: v,
                      ),
                    ),

                    //Container with coins and amount
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 50),
                      child: Text("Monedas: " + monedas.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                              image: AssetImage("assets/fondoScroll.jpg"),
                              fit: BoxFit.cover)),
                      margin: EdgeInsets.only(top: 35),
                      child: Scroll(),
                    )
                  ],
                ),
              ),
            )));
  }
}

//Clase scroll
class Scroll extends StatelessWidget {
  // Ejemplo de como hacer una mejora para compra
  void mejora1() {
    if (monedas > 20) {
      golpe = golpe + 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 170.0,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          //Este SizedBox se utiliza para separar cada container
          SizedBox(
            width: 10,
          ),

          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),

          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),

          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/fondoItems.jpg"),
                      fit: BoxFit.cover)),
              width: 160.0,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 208, 0), width: 4),
                    image: DecorationImage(
                        image: AssetImage("assets/dragon.png"),
                        fit: BoxFit.cover)),
              )),
        ],
      ),
    );
  }
}
