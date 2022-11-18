// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print
import "mejoras.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'monstruo.dart';
import 'dart:math';
import 'dart:async';

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
  "assets/Mundo1.jpg",
  "assets/Mundo2.jpg",
  "assets/Mundo3.jpg"
];

double v = 12;

// Ruta de imagen inicial
String rutaMonstruo = listaMonstruos[contador].imagenRuta;
int indexImagen = 0;
// Vida inicial
double vida = listaMonstruos[contador].vida;
// Timers
Timer? timer1;
// Timer ? timer2;

// Variables para dps
double danoDps1 = 1;
// double danoDps2 =1;

// Variables de tiempo para controlar los timers
int segundos1 = 0;
// int segundos2=0;

Mejoras mejoraJuego = Mejoras();

// Contador para cambiar de monstruo
int contador = 0;
int monedasJugador = 0;
int monedasRecibidas = 5;
double golpeSencillo = 100;
double golpeGlobal = golpeGlobal + golpeSencillo;
double golpeCritico = 1000;
bool probabilidadCritico = true;
int temporizadorDeCritico = 0;

//Variables para controlar las mejoras
bool mejora1 = false;
bool mejora2 = false;
bool mejora3 = false;
bool mejora4 = false;
bool mejora5 = false;
bool mejora6 = false;
bool mejora7 = false;
bool mejora8 = false;
bool mejora9 = false;

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
// //Variables para cambiar de monstruo
//   double vida = listaMonstruos[contador].vida;

  @override
  Widget build(BuildContext context) {
    void vidaResta() {
      // Resto uno de vida y sumo 5 monedas
      setState(() {
        temporizadorDeCritico++;
        vida = vida - golpeGlobal;
        print("Vida: " + vida.toString());
        monedasJugador = monedasJugador + monedasRecibidas;
        print("Monedas: " + monedasJugador.toString());
        if (vida < 0) {
          final snackBar = SnackBar(content: const Text("Has matado al monstruo"));
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

    void dps1() {
      timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
        segundos1 += 1;
        // Como implementamos esto?????????¿?
        setState(() {
          vida = vida - danoDps1;
          monedasJugador = monedasJugador + 5;
        });
      });
    }

    //Si el rng (numero aleatorio entre 0 y 9) es igual a 4 el golpe global sera un critico, sino sera un golpeSencillo
    void critico() {
      Random random = Random();
      int rng = random.nextInt(10);
      temporizadorDeCritico > 10 && rng == 4
          ? golpeGlobal = golpeCritico
          : golpeGlobal = golpeSencillo;
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
                             if(vida == 0){
                              final snackBar = SnackBar(content: const Text("Has matado al monstruo"));
                            }
                            critico();
                            vidaResta();
                            
                          
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
                      child: Text("Monedas: " + monedasJugador.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    Container(
                      height: 180,
                      
                      margin: EdgeInsets.only(top: 35),
                      child:
                          // Scroll()
                          Container(
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
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      
                                      mejora1 = true;
                                      // Scaffold.of(context).showSnackBar(
                                      // final snackBarMejora1 = SnackBar(content: const Text("Has matado al monstruo"));
                            
                                      //Incrementacion del golpe sencillo
                                      golpeSencillo = mejoraJuego.mejora1(
                                          mejora1, golpeSencillo);
                                      print("Compra de mejora1");
                                    },
                                    
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
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
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      mejora2 = true;
                                      //Indicamos que las monedas se duplican
                                      monedasRecibidas = mejoraJuego.mejora2(
                                          mejora2, monedasRecibidas);
                                      print("Compra de mejora2");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),

                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      dps1();
                                      mejora3 = true;
                                      print("Compra de mejora 3");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),

                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/fondoItems.jpg"),
                                        fit: BoxFit.cover)),
                                width: 160.0,
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      print("Compra de mejora");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 255, 208, 0),
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/dragon.png"),
                                          fit: BoxFit.cover)),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
            )));
  }
}

// //Clase scroll
// class Scroll extends StatelessWidget {
//   Mejoras mejoraJuego = Mejoras();
//   // Función para daño por tiempo
//     void dps1(){
//       timer1=Timer.periodic(Duration(seconds: 1), (timer) {
//         segundos1 +=1;
//         // Como implementamos esto?????????¿?
//         setState(() {
//           vida=vida-danoDps1;
//           monedasJugador=monedasJugador+5;
//         });
//        });



//     }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 20.0),
  //     height: 170.0,
  //     child: ListView(
  //       // This next line does the trick.
  //       scrollDirection: Axis.horizontal,
  //       children: <Widget>[
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   mejora1 = true;
  //                   //Incrementacion del golpe sencillo
  //                   golpeSencillo = mejoraJuego.mejora1(mejora1, golpeSencillo);
  //                   print("Compra de mejora1");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         //Este SizedBox se utiliza para separar cada container
  //         SizedBox(
  //           width: 10,
  //         ),

  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   mejora2 = true;
  //                   //Indicamos que las monedas se duplican
  //                   monedasRecibidas =
  //                       mejoraJuego.mejora2(mejora2, monedasRecibidas);
  //                   print("Compra de mejora2");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),

  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   dps1();
  //                   mejora3 = true;
  //                   print("Compra de mejora 3");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),

  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Container(
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 image: DecorationImage(
  //                     image: AssetImage("assets/fondoItems.jpg"),
  //                     fit: BoxFit.cover)),
  //             width: 160.0,
  //             child: Container(
  //               child: InkWell(
  //                 onTap: () {
  //                   print("Compra de mejora");
  //                 },
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(
  //                       color: Color.fromARGB(255, 255, 208, 0), width: 4),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/dragon.png"),
  //                       fit: BoxFit.cover)),
  //             )),
  //       ],
  //     ),
  //   );
 // }
//  }
