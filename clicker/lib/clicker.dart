//ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

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
    vida: 100000,
    imagenRuta: "assets/pequeñoCola1.png",
    identificador: 1,
  ),
  monstruo(
    nombre: "Daniel",
    vida: 6000,
    imagenRuta: "assets/monstruo2.png",
    identificador: 2,
  ),
  monstruo(
    nombre: "Nelson",
    vida: 12000,
    imagenRuta: "assets/plantaCarnivora3.png",
    identificador: 3,
  ),
  monstruo(
    nombre: "Laura",
    vida: 24000,
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
// Index para identificarlo
int indexImagen = 0;
// Vida inicial
double vida = listaMonstruos[contador].vida;
// Timers para variables por dps

//Timers

Timer? timer2;
Timer? timer1;
// Variables para dps
double danoDps1 = 5;

// Variables de tiempo para controlar los timers
int segundos1 = 0;
int segundos2 = 0;
// int segundos2=0;

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
bool bolaFuegoActivada = false;
bool poderUsarBolaFuego = true;

//Precios globales de mejoras para imprimnir por pantalla

// Precios de mejora1
int precio1Mejora1 = 100;
int precio2Mejora1 = 400;
int precio3Mejora1 = 800;
int precioMejoraGlobal1 = 100;
int contadorMejora1 = 0;

//Precios de mejora2
int precio1Mejora2 = 200;
int precio2Mejora2 = 600;
int precio3Mejora2 = 1200;
int precioMejoraGlobal2 = 200;
int contadorMejora2 = 0;

//Precios de mejora3
int precio1Mejora3 = 100;
int precio2Mejora3 = 500;
int precio3Mejora3 = 1000;
int precioMejoraGlobal3 = 100;
int contadorMejora3 = 0;

//Precios de mejora 4
int precio1Mejora4 = 50;
int precio2Mejora4 = 100;
int precio3Mejora4 = 300;
int precio4Mejora4 = 900;
int precioMejoraGlobal4 = 50;
int contadorMejora4 = 0;

//Precios y variables para controlar la posicion aleaotoria de las imagenes de la mejora5
double rngLeft = 0;

int contadorMejora5 = 0;
int precioMejoraGlobal5 = 100;
int precio1Mejora5 = 100;
int precio2Mejora5 = 400;
int precio3Mejora5 = 900;
String imagenAleatoria = "";
int monedasGanadasPorImagen = 0;
int mostrarMejora5Maxima = 0;

// Variable para comparar con la vidaMax de un monstruo e
// ir actualizando la barra de vida
double v = 1;

// Casos de vidaMax para comparacion
double vidaMax100 = vida;
double vidaMax90 = (vida * 0.9);
double vidaMax80 = (vida * 0.8);
double vidaMax70 = (vida * 0.7);
double vidaMax60 = (vida * 0.6);
double vidaMax50 = (vida * 0.5);
double vidaMax40 = (vida * 0.4);
double vidaMax30 = (vida * 0.3);
double vidaMax20 = (vida * 0.2);
double vidaMax10 = (vida * 0.1);
// En el caso 0 no necesito esta variable

// Variable Color para la barra de vida
Color ColorValue = Colors.greenAccent;

//Mensaje snackbar
String mensajeMaximaMejora = "Nivel Máximo de Mejora Alcanzado";

// Varible para música
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
    //Fucion vidaResta
    void vidaResta() {
      // Resto uno de vida y sumo 5 monedas
      setState(() {
        temporizadorDeCritico++;
        vida = vida - golpeGlobal;
        print("Vida: " + vida.toString());
        monedasJugador = monedasJugador + monedasRecibidas;
        print("Monedas: " + monedasJugador.toString());
        if (vida < 0) {
          contador++;
          // Cambiamos de monstruo en función al contador por lo que asignamos a las variables su vida y su ruta de imagen
          vida = listaMonstruos[contador].vida;
          rutaMonstruo = listaMonstruos[contador].imagenRuta;
          // Actualizo las variables para barra de vida
          vidaMax90 = (vida * 0.9);
          vidaMax80 = (vida * 0.8);
          vidaMax70 = (vida * 0.7);
          vidaMax60 = (vida * 0.6);
          vidaMax50 = (vida * 0.5);
          vidaMax40 = (vida * 0.4);
          vidaMax30 = (vida * 0.3);
          vidaMax20 = (vida * 0.2);
          vidaMax10 = (vida * 0.1);
          v = 1;

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

    //Funcion para la musica
    void playFile(String url) {
      player.play(AssetSource(url));
    }

    //SnakBar para mostrar el maxima de mejora alcanzado
    void mostrarMaximaMejora(BuildContext context) {
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

    //SnackBar para mostrar que se ha comprado una mejora
    void mostrarMejoraComprada(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("Mejora comprada")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    //SnackBar para mostrar que se ha comprado una mejora
    void bolaDeFuegoActivada(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("Bola de fuego activada")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    void bolaDeFuegoDesactivada(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("No se puede utilizar la bola de fuego")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    //Lista de mejoras:
    //Todas las mejoras tienen el mismo funcionamiento

    //Mejora1
    void mejora1() {
      if (contadorMejora1 == 0 && monedasJugador > precio1Mejora1) {
        setState(() {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio2Mejora1;
        });
        print(precioMejoraGlobal1);
        mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 2;
        contadorMejora1++;
        monedasJugador = monedasJugador - precio1Mejora1;
      }
      if (contadorMejora1 == 1 && monedasJugador > precio2Mejora1) {
        setState(() {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio3Mejora1;
        });
        mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 3;
        contadorMejora1++;
        monedasJugador = monedasJugador - precio2Mejora1;
      }
      if (contadorMejora1 == 2 && monedasJugador > precio3Mejora1) {
        mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 4;
        contadorMejora1++;
        monedasJugador = monedasJugador - precio3Mejora1;
      }
      if (contadorMejora1 > 2) {
        mostrarMaximaMejora(context);
      }
    }

    //Mejora2
    void mejora2() {
      if (contadorMejora2 == 0 && monedasJugador > precio1Mejora2) {
        setState(() {
          precioMejoraGlobal2 = precio2Mejora2;
        });
        mostrarMejoraComprada(context);
        monedasRecibidas = monedasRecibidas + 10;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio1Mejora2;
      }
      if (contadorMejora2 == 1 && monedasJugador > precio2Mejora2) {
        setState(() {
          precioMejoraGlobal2 = precio3Mejora2;
        });
        mostrarMejoraComprada(context);
        monedasRecibidas = monedasRecibidas + 20;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio2Mejora2;
      }
      if (contadorMejora2 == 2 && monedasJugador > precio3Mejora2) {
        mostrarMejoraComprada(context);
        monedasRecibidas = monedasRecibidas + 25;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio3Mejora2;
      }
      if (contadorMejora2 > 2) {
        mostrarMaximaMejora(context);
      }
    }

    //Mejora 3
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

    //Mejora 4
    void mejora4() {
      if (contadorMejora4 == 0 && monedasJugador > precio1Mejora4) {
        //Restamos monedas jugador
        monedasJugador = monedasJugador - precio1Mejora4;
        //Actualizamos el precio
        precioMejoraGlobal4 = precio2Mejora4;
        //Ataque de bola de fuego Lvl 1
        double bolaFuegoV1 = 1000;
        setState(() {
          vida = vida - bolaFuegoV1;
        });
        contadorMejora4++;

        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 1 && monedasJugador > precio2Mejora4) {
        monedasJugador = monedasJugador - precio2Mejora4;
        precioMejoraGlobal4 = precio3Mejora4;
        //Ataque de bola de fuego Lvl 2
        double bolaFuegoV2 = 2000;
        setState(() {
          vida = vida - bolaFuegoV2;
        });
        contadorMejora4++;
        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 2 && monedasJugador > precio3Mejora4) {
        //Ataque de bola de fuego Lvl 1
        double bolaFuegoV3 = 3000;
        precioMejoraGlobal4 = precio4Mejora4;
        setState(() {
          vida = vida - bolaFuegoV3;
        });
        contadorMejora4++;
        monedasJugador = monedasJugador - precio3Mejora4;
        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 > 2 && bolaFuegoActivada == false) {
        mostrarMaximaMejora(context);

        timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
          //Solo empezara la cuenta atras cuando la variable que controla si ya hemos utilizado o no la habilidad se ponga a true
          //sino la cuenta no empezara, con lo cual aunque pase un minuto no podremos usar la habilidad
          if (poderUsarBolaFuego == true) {
            segundos2++;
          }
          print(segundos2);

          if (segundos2 == 60) {
            bolaDeFuegoActivada(context);
            //Cuando hayan pasado los veinte segundos podremos utilizar la habilidad
            bolaFuegoActivada = true;
            //Seteamos la variable a false, para que el temporizador no se vuelva a incrementar
            poderUsarBolaFuego = false;
            segundos2 = 0;
          }
        });
      }
      if (bolaFuegoActivada == true && monedasJugador > precio4Mejora4) {
        //Ataque bola de fuego lvl final
        double bolaFuegoVFinal = 10000;
        setState(() {
          vida = vida - bolaFuegoVFinal;
        });
        monedasJugador = monedasJugador - precio4Mejora4;

        //Al usar la bola de fuego la seteamos a false
        bolaFuegoActivada = false;
        //Una vez de que se utilice seteamos esta variable para indicar que se podra utilizar de nuevo la habilidad
        poderUsarBolaFuego = true;
      }
    }

    //Mejora5
    String mejora5() {
      //Variable random que se asignara al valor de separacion con el borde izquierdo
      Random randomLeft = Random();

      //Valores de entre 1.00 y 99.00
      rngLeft = randomLeft.nextDouble() * 100;

      if (contadorMejora5 == 0 && monedasJugador > precio1Mejora5) {
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 500;
        contadorMejora5++;
        precioMejoraGlobal5 = precio2Mejora5;
        monedasJugador = monedasJugador - precio1Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 1 && monedasJugador > precio2Mejora5) {
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 750;
        contadorMejora5++;
        precioMejoraGlobal5 = precio3Mejora5;
        monedasJugador = monedasJugador - precio2Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 2 && monedasJugador > precio3Mejora5) {
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 1000;
        contadorMejora5++;
        monedasJugador = monedasJugador - precio3Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 > 2 && monedasJugador > precio3Mejora5) {
        //Con esto conseguimos que una vez que el usuario haya alcanzado el tope de mejora solo le muestre el mensaje de "Mejora maxima" la primera vez que
        //clicka en ella dsp de alcanzar el nivel maximo
        if (mostrarMejora5Maxima == 0) {
          mostrarMaximaMejora(context);
        }
        mostrarMejora5Maxima++;

        monedasJugador = monedasJugador - precio3Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      return "";
    }

    //Si el rng (numero aleatorio entre 0 y 9) es igual a 4 el golpe global sera un critico, sino sera un golpeSencillo
    void critico() {
      Random random = Random();
      int rng = random.nextInt(10);
      temporizadorDeCritico > 10 && rng == 4
          ? golpeGlobal = golpeCritico
          : golpeGlobal = golpeSencillo;
    }

    //Funcion para barra de vida
    double controladorBarra(v) {
      setState(() {
        if (vida <= vidaMax100 && vida > vidaMax90) {
          v = v;
        }
        if (vida <= vidaMax90 && vida > vidaMax80) {
          v = v - 0.1;
        }
        if (vida <= vidaMax80 && vida > vidaMax70) {
          v = v - 0.2;
        }
        if (vida <= vidaMax70 && vida > vidaMax60) {
          v = v - 0.3;
        }
        if (vida <= vidaMax60 && vida > vidaMax50) {
          v = v - 0.4;
        }
        if (vida <= vidaMax50 && vida > vidaMax40) {
          v = v - 0.5;
        }
        if (vida <= vidaMax40 && vida > vidaMax30) {
          v = v - 0.6;
        }
        if (vida <= vidaMax30 && vida > vidaMax20) {
          v = v - 0.7;
        }
        if (vida <= vidaMax20 && vida > vidaMax10) {
          v = v - 0.8;
        }
        if (vida <= vidaMax10 && vida > 0) {
          v = v - 0.9;
        }
        if (vida == 0) {
          v = 0;
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
                      child: Row(
                        children: [
                          // Containers para control de música
                          Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: IconButton(
                              onPressed: (() => setState(() {
                                    player.play(AssetSource("musicaCruzi.mp3"));
                                  })),
                              icon: Icon(Icons.speaker),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              child: Text("Play",
                                  style: TextStyle(color: Colors.white))),
                          Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: IconButton(
                              onPressed: (() => setState(() {
                                    player.stop();
                                  })),
                              icon: Icon(Icons.speaker),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              child: Text("Stop",
                                  style: TextStyle(color: Colors.white))),
                          //Container with world´s title
                          Container(
                            margin: EdgeInsets.all(30),
                            alignment: Alignment.topRight,
                            child: Text("Mundo 1",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    //Container que contendra la imagen en posicion aleatoria
                    Container(
                      child: Row(children: [
                        Container(
                            //Valores de margen aleatorios, MENOS EL TOP Y EL BOTTOM
                            margin: EdgeInsets.only(right: 5, left: rngLeft),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imagenAleatoria))),
                            height: 32,
                            width: 50,
                            child: InkWell(onTap: () {
                              setState(() {
                                monedasJugador =
                                    monedasJugador + monedasGanadasPorImagen;
                              });
                              //Una vez se haya clickado en la imagen esta desaparecera
                              imagenAleatoria = "";
                            })),
                      ]),
                    ),
                    //Container with monster´s image
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            critico();
                            vidaResta();
                            setState(() {
                              playFile("music/musicaCruzi.mp3");
                            });
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
                        margin: EdgeInsets.only(top: 30, left: 10),
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(monedasJugador.toString(),
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white)),
                          ),
                          Container(
                              width: 100,
                              height: 50,
                              child: Image.asset("assets/MonedasPrueba.png")),
                        ])),

                    // Container del scroll()
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/fondoScroll.jpg"),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.yellowAccent)),
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 220.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //Container con el primer item
                          // ignore: todo
                          //Este container contendra TODO
                          Container(
                              width: 160,
                              //Columna que contendra la imagen y la fila con el precio de la mejora y la imagen de las monedas
                              child: Column(children: [
                                //Container donde esta la imagen
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                //Este container contendra la fila
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    //Creamos la fila
                                    child: Row(children: [
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 50,
                          ),
                          //Container del segundo item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora2();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/arco.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 30),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal2.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 50,
                          ),
                          //Container del tercer item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        if (contadorMejora3 == 0 &&
                                            monedasJugador > precio1Mejora3) {
                                          setState(() {
                                            precioMejoraGlobal3 =
                                                precio2Mejora3;
                                          });
                                          contadorMejora3++;
                                          dps1(contadorMejora3);

                                          monedasJugador =
                                              monedasJugador - precio1Mejora3;
                                        }
                                        if (contadorMejora3 == 1 &&
                                            monedasJugador > precio2Mejora3) {
                                          contadorMejora3++;
                                          dps1(contadorMejora3);
                                          setState(() {
                                            precioMejoraGlobal3 =
                                                precio3Mejora3;
                                          });
                                          monedasJugador =
                                              monedasJugador - precio2Mejora3;
                                        }

                                        if (contadorMejora3 == 2 &&
                                            monedasJugador > precio3Mejora3) {
                                          contadorMejora3++;
                                          dps1(contadorMejora3);
                                          monedasJugador =
                                              monedasJugador - precio3Mejora3;
                                        }

                                        if (contadorMejora3 == 3) {
                                          mostrarMaximaMejora(context);
                                        }
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/DañoPasiva.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 30),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal3.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 50,
                          ),
                          //Container del cuarto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora4();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/BolaFuego.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 35),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal4.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del quinto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora5();
                                        print(rngLeft);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/ImagenAleatoria.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal5.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del sexto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del septimo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del octavo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del noveno item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del decimo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 150,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    height: 23,
                                    margin: EdgeInsets.only(top: 5, left: 60),
                                    child: Row(children: [
                                      Container(
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white))),
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
