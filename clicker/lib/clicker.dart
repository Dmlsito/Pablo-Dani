// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print
import "mejoras.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'monstruo.dart';
import 'dart:math';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

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



// Ruta de imagen inicial
String rutaMonstruo = listaMonstruos[contador].imagenRuta;
int indexImagen = 0;
// Vida inicial
double vida = listaMonstruos[contador].vida;
// Timers
Timer? timer1;
// Timer ? timer2;

// Variables para dps
double danoDps1 = 5;
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

// Precios mejoras
int precioMejora3 = 100;
int contadorMejora3 = 0;

// Variable para comparar con la vidaMax de un monstruo e
// ir actualizando la barra de vida
double v = 1;

// Casos de vidaMax para comparacion
double vidaMax100= vida;
double vidaMax90 = (vida*0.9);
double vidaMax80 = (vida*0.8);
double vidaMax70 = (vida*0.7);
double vidaMax60 = (vida*0.6);
double vidaMax50 = (vida*0.5);
double vidaMax40 = (vida*0.4);
double vidaMax30 = (vida*0.3);
double vidaMax20 = (vida*0.2);
double vidaMax10 = (vida*0.1);
// En el caso 0 no necesito esta variable

// Variable Color para la barra de vida
Color ColorValue = Colors.greenAccent;

//Mensaje snackbar
String mensajeMaximaMejora = "Nivel Máximo de Mejora Alcanzado";

final player = AudioPlayer();

 
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
          final snackBar =
              SnackBar(content: const Text("Has matado al monstruo"));
          contador++;
          // Cambiamos de monstruo en función al contador por lo que asignamos a las variables su vida y su ruta de imagen
          vida = listaMonstruos[contador].vida;
          rutaMonstruo = listaMonstruos[contador].imagenRuta;
          // Actualizo las variables para barra de vida
           vidaMax90 = (vida*0.9);
           vidaMax80 = (vida*0.8);
           vidaMax70 = (vida*0.7);
           vidaMax60 = (vida*0.6);
           vidaMax50 = (vida*0.5);
           vidaMax40 = (vida*0.4);
           vidaMax30 = (vida*0.3);
           vidaMax20 = (vida*0.2);
           vidaMax10 = (vida*0.1);
          v=1;
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

    void playFile(String url) {
    player.play(AssetSource(url));
  }

    void mostrarMaximaMejora(BuildContext context, String mensaje) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text(mensajeMaximaMejora)
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    void dps1(contadorMejora3) {
      timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
        segundos1 += 1;

        setState(() {
          if (contadorMejora3 == 1) {
            vida = vida - danoDps1;
            monedasJugador = monedasJugador + 5;
          }
          if (contadorMejora3 == 2) {
            vida = vida - (danoDps1 * 2);
            monedasJugador = monedasJugador + 10;
          }
          if (contadorMejora3 == 3) {
            vida = vida - (danoDps1 * 3);
            monedasJugador = monedasJugador + 15;
          }
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


      double controladorBarra(v){
      setState(() {
        if(vida<=vidaMax100 && vida>vidaMax90){
            v=v;
        }
        if(vida<=vidaMax90 && vida>vidaMax80){
          v=v-0.1;
        }
        if(vida<=vidaMax80 && vida>vidaMax70){
          v=v-0.2;
        }
        if(vida<=vidaMax70 && vida>vidaMax60){
          v=v-0.3;
        }
        if(vida<=vidaMax60 && vida>vidaMax50){
          v=v-0.4;
        }
        if(vida<=vidaMax50 && vida>vidaMax40){
          v=v-0.5;
        }
        if(vida<=vidaMax40 && vida>vidaMax30){
          v=v-0.6;
        }
        if(vida<=vidaMax30 && vida>vidaMax20){
          v=v-0.7;
        }
        if(vida<=vidaMax20 && vida>vidaMax10){
          v=v-0.8;
        }
        if(vida<=vidaMax10 && vida>0){
          v=v-0.9;
        }
        if(vida==0){
          v=0;

        }
         
      });
        
      return v;

    }

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listaMundos[indexImagen]),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: [
                    Container(
                      child: IconButton(onPressed:(() => setState(() {
                        player.play(AssetSource("musicaCruzi.mp3"));
                      })) , icon:Icon(Icons.speaker) ),
                    ),
                    Container(
                      child:IconButton(onPressed:(() => setState(() {
                        player.stop();
                      })) , icon:Icon(Icons.speaker) ),
                    ),
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
                            if (vida == 0) {
                              final snackBar = SnackBar(
                                  content:
                                      const Text("Has matado al monstruo"));
                            }
                            critico();
                            vidaResta();
                            playFile("music/musicaCruzi.mp3");
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
                      width: 300,
                      height: 20,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorValue),
                        backgroundColor: Colors.redAccent,
                        value: 
                        // Llamo a la función y como parámetro v
                         controladorBarra(v),
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
                                      if (contadorMejora3 == 0 &&
                                          monedasJugador > precioMejora3) {
                                        contadorMejora3++;
                                        dps1(contadorMejora3);

                                        monedasJugador =
                                            monedasJugador - precioMejora3;
                                      }
                                      if (contadorMejora3 == 1 &&
                                          monedasJugador >
                                              (precioMejora3 * 2)) {
                                        contadorMejora3++;
                                        dps1(contadorMejora3);
                                        monedasJugador = monedasJugador -
                                            (precioMejora3 * 2);
                                      }

                                      if (contadorMejora3 == 2 &&
                                          monedasJugador >
                                              (precioMejora3 * 3)) {
                                        contadorMejora3++;
                                        dps1(contadorMejora3);
                                        monedasJugador = monedasJugador -
                                            (precioMejora3 * 3);
                                      }

                                      if (contadorMejora3 == 3) {
                                        mostrarMaximaMejora(
                                            context, mensajeMaximaMejora);
                                      }
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
