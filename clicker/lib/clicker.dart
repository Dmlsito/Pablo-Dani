//ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'Usuario.dart';
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
      vida: 30000,
      imagenRuta: "assets/caballeroAnimado.gif",
      identificador: 1),
  monstruo(
    nombre: "Daniel",
    vida: 6000,
    imagenRuta: "assets/caballeroAnimadoPrueba2.gif",
    identificador: 2,
  ),
  monstruo(
    nombre: "Nelson",
    vida: 12000,
    imagenRuta: "assets/caballeroAnimado2.gif",
    identificador: 3,
  ),
  monstruo(
    nombre: "Laura",
    vida: 24000,
    imagenRuta: "assets/animadoMundoFuego1.gif",
    identificador: 4,
  ),
  monstruo(
    nombre: "Hugo",
    vida: 16000,
    imagenRuta: "assets/animadoMundoFuego1.gif",
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
String colorPrueba = "0xffF856DF";
Color colorLetras = Color(0xff660000);

//Timers

Timer? timer2;
Timer? timer1;
Timer? timer3;
// Variables para dps
double danoDps1 = 5;

// Variables de tiempo para controlar los timers
int segundos1 = 0;
int segundos2 = 0;

//Variables para mostrar dps
double danoDpsTotal = 0;
double mostrarDanoDps = 0;

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
int mostrarMejora1Maxima = 0;
bool mejora1V1 = false;
bool mejora1V2 = false;
bool mejora1V3 = false;

//Precios de mejora2
int precio1Mejora2 = 200;
int precio2Mejora2 = 600;
int precio3Mejora2 = 1200;
int precioMejoraGlobal2 = 200;
int contadorMejora2 = 0;
int mostrarMejora2Maxima = 0;
bool mejora2V1 = false;
bool mejora2V2 = false;
bool mejora2V3 = false;

//Precios de mejora3
int precio1Mejora3 = 100;
int precio2Mejora3 = 500;
int precio3Mejora3 = 1000;
int precioMejoraGlobal3 = 100;
int contadorMejora3 = 0;
int mostrarMejora3Maxima = 0;
bool mejora3V1 = false;
bool mejora3V2 = false;
bool mejora3V3 = false;

//Precios de mejora 4
int precio1Mejora4 = 50;
int precio2Mejora4 = 100;
int precio3Mejora4 = 300;
int precio4Mejora4 = 900;
int precioMejoraGlobal4 = 50;
int contadorMejora4 = 0;
int mostrarMejora4Maxima = 0;
bool mejora4V1 = false;
bool mejora4V2 = false;
bool mejora4V3 = false;

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
bool mejora5V1 = false;
bool mejora5V2 = false;
bool mejora5V3 = false;

//Variables de mejora6
int contadorMejora6 = 0;
int precioMejoraGlobal6 = 50;
int precio1Mejora6 = 50;
int precio2Mejora6 = 300;
int precio3Mejora6 = 600;
bool mejora6V1 = false;
bool mejora6V2 = false;
bool mejora6V3 = false;

//Variables de mejora7
int contadorMejora7 = 0;
int precioMejoraGlobal7 = 50;
int precio1Mejora7 = 50;
int precio2Mejora7 = 300;
int precio3Mejora7 = 500;
bool mejora7V1 = false;
bool mejora7V2 = false;
bool mejora7V3 = false;
int bombas = 0;
int cantidadBombasV1 = 3;
int cantidadBombasV2 = 3;
int cantidadBombasV3 = 3;
int danoBomba = 200;

//Variables de mejora 8
int contadorMejora8 = 0;

int precio1Mejora8 = 100;
int precio2Mejora8 = 200;
int precio3Mejora8 = 300;
int precioMejoraGlobal8 = 100;
bool mejora8Utilizada = true;

//Variables de mejora9

int contadorMejora9 = 0;
bool mejora9V1 = false;
bool mejora9V2 = false;
bool mejora9V3 = false;
int precio1Mejora9 = 50;
int precio2Mejora9 = 100;
int precio3Mejora9 = 150;
int precioMejoraGlobal9 = 50;
int danoHielo = 100;
bool lluviaHeladaV1 = true;
bool lluviaHeladaV2 = true;
bool lluviaHeladaV3 = true;
int duracionTormentaV1 = 0;
int duracionTormentaV2 = 0;
int duracionTormentaV3 = 0;

// Variable para comparar con la vidaMax de un monstruo e
// ir actualizando la barra de vida
double v = 1;

//Variable para ir actualizando la barra de mejora
double valorMejora = 0;
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
Color verde = Color(0xff00FF00);
// Variable Color para la barra de vida
Color ColorValue = Colors.greenAccent;
Color transparent = Color.fromARGB(0, 255, 255, 128);

//Mensaje snackbar
String mensajeMaximaMejora = "Nivel Máximo de Mejora Alcanzado";

// Varible para música
final player = AudioPlayer();

// Variables para ancho y alto de pantalla para ventana emergente
var anchoPantalla, alturaPantalla, size;

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
// //Variables para cambiar de monstruo
//   double vida = listaMonstruos[contador].vida;

  @override
  Widget build(BuildContext context) {
    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });

    final usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
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

    void bufoEspada(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("La espada ha sido bufado")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    void bufoArco(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("El arco ha sido bufado")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    void escarchaON(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("Una tormenta ha comenzado")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    void escarchaOF(BuildContext context) {
      final snb = SnackBar(
        content: Row(
          children: [
            Icon(Icons.thumb_up),
            SizedBox(
              width: 20,
            ),
            Text("La tormenta ha finaizado")
          ],
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snb);
    }

    //Lista de mejoras:
    //Todas las mejoras tienen el mismo funcionamiento

    //Mejora1
    void mejora1() {
      if (contadorMejora1 == 0 && monedasJugador >= precio1Mejora1) {
        setState(() {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio2Mejora1;
        });
        mejora1V1 = true;

        mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 2;
        contadorMejora1++;
        //Controlamos si el jugador ha comprado la mejora8

        monedasJugador = monedasJugador - precio1Mejora1;
      }
      if (contadorMejora1 == 1 && monedasJugador >= precio2Mejora1) {
        setState(() {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio3Mejora1;
        });
        mejora1V2 = true;

        mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 3;
        contadorMejora1++;

        monedasJugador = monedasJugador - precio2Mejora1;
      }
      if (contadorMejora1 == 2 && monedasJugador >= precio3Mejora1) {
        mejora1V3 = true;
        mostrarMejoraComprada(context);
        mostrarMaximaMejora(context);
        golpeSencillo = golpeSencillo * 4;
        contadorMejora1++;
        monedasJugador = monedasJugador - precio3Mejora1;
      }
      //Bufo extra
      if (contadorMejora1 > 2 && mejora8Utilizada == false) {
        monedasJugador = monedasJugador;
        //Indicamos que el bufo ya se ha utilizado

        bufoEspada(context);
        golpeSencillo = golpeSencillo * 8;
      }
    }

    //Mejora2
    void mejora2() {
      if (contadorMejora2 == 0 && monedasJugador >= precio1Mejora2) {
        mejora2V1 = true;
        setState(() {
          precioMejoraGlobal2 = precio2Mejora2;
        });
        mostrarMejoraComprada(context);
        monedasRecibidas = 10;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio1Mejora2;
      }
      if (contadorMejora2 == 1 && monedasJugador >= precio2Mejora2) {
        mejora2V2 = true;
        setState(() {
          precioMejoraGlobal2 = precio3Mejora2;
        });
        mostrarMejoraComprada(context);
        monedasRecibidas = 20;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio2Mejora2;
      }
      if (contadorMejora2 == 2 && monedasJugador >= precio3Mejora2) {
        mejora2V3 = true;
        mostrarMejoraComprada(context);
        mostrarMaximaMejora(context);
        monedasRecibidas = 30;
        contadorMejora2++;
        monedasJugador = monedasJugador - precio3Mejora2;
      }
      if (contadorMejora2 > 2 && mejora8Utilizada == false) {
        monedasJugador = monedasJugador;
        bufoArco(context);
        monedasRecibidas = 60;
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
            danoDpsTotal = 5;
          }
          if (contadorMejora3 == 2) {
            vida = vida - (danoDps1 * 2);
            monedasJugador = monedasJugador + 10;
            danoDpsTotal = 10;
          }
          if (contadorMejora3 == 3) {
            vida = vida - (danoDps1 * 3);
            monedasJugador = monedasJugador + 15;
            danoDpsTotal = 15;
          }
          //Variable para ayuda
          mostrarDanoDps = danoDpsTotal;
        });
      });
    }

    //Mejora 4
    void mejora4() {
      if (contadorMejora4 == 0 && monedasJugador >= precio1Mejora4) {
        mejora4V1 = true;
        //Restamos monedas jugador
        monedasJugador = monedasJugador - precio1Mejora4;
        //Actualizamos el precio
        precioMejoraGlobal4 = precio2Mejora4;
        //Ataque de bola de fuego Lvl 1
        double bolaFuegoV1 = 1000;
        setState(() {
          vida = vida - bolaFuegoV1;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
        });
        contadorMejora4++;

        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 1 && monedasJugador >= precio2Mejora4) {
        mejora4V2 = true;
        monedasJugador = monedasJugador - precio2Mejora4;
        precioMejoraGlobal4 = precio3Mejora4;
        //Ataque de bola de fuego Lvl 2
        double bolaFuegoV2 = 2000;
        setState(() {
          vida = vida - bolaFuegoV2;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
        });
        contadorMejora4++;
        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 2 && monedasJugador >= precio3Mejora4) {
        mejora4V3 = true;
        //Ataque de bola de fuego Lvl 1
        double bolaFuegoV3 = 3000;
        precioMejoraGlobal4 = precio4Mejora4;
        setState(() {
          vida = vida - bolaFuegoV3;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
        });
        contadorMejora4++;
        monedasJugador = monedasJugador - precio3Mejora4;
        mostrarMejoraComprada(context);
      }
      if (contadorMejora4 > 2 && bolaFuegoActivada == false) {
        //clicka en ella dsp de alcanzar el nivel maximo
        if (mostrarMejora4Maxima == 0) {
          mostrarMaximaMejora(context);
        }
        mostrarMejora4Maxima++;

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

      if (contadorMejora5 == 0 && monedasJugador >= precio1Mejora5) {
        mejora5V1 = true;
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 500;
        contadorMejora5++;
        precioMejoraGlobal5 = precio2Mejora5;
        monedasJugador = monedasJugador - precio1Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 1 && monedasJugador >= precio2Mejora5) {
        mejora5V2 = true;
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 750;
        contadorMejora5++;
        precioMejoraGlobal5 = precio3Mejora5;
        monedasJugador = monedasJugador - precio2Mejora5;
        imagenAleatoria = "assets/.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 2 && monedasJugador >= precio3Mejora5) {
        mejora5V3 = true;
        mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 1000;
        contadorMejora5++;
        monedasJugador = monedasJugador - precio3Mejora5;
        imagenAleatoria = "assets/tioAltavoz.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 > 2 && monedasJugador >= precio3Mejora5) {
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

    void mejora6() {
      if (contadorMejora6 == 0 && monedasJugador > precio1Mejora6) {
        mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 20% de probabilidad de q la bomba explote
        Random bombaVersion1 = Random();
        int rngBomba = bombaVersion1.nextInt(4);
        setState(() {
          if (rngBomba == 2) {
            vida = vida - vida;
          }
        });
        //Actualizamos el precio de la mejora
        precioMejoraGlobal6 = precio2Mejora6;
        //Seteamos a true la variable que controla la aparicion de el indicador de mejora
        mejora6V1 = true;
        //Actualizamos las monedas del jugador
        contadorMejora6++;
        monedasJugador = monedasJugador - precio1Mejora6;
      }
      if (contadorMejora6 == 1 && monedasJugador > precio2Mejora6) {
        mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 37.5% de probabilidad de q la bomba explote
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(3);
        setState(() {
          if (rngBomba == 2) {
            vida = vida - vida;
          }
        });
        mejora6V2 = true;
        //Actualizamos el precio de la mejora
        precioMejoraGlobal6 = precio3Mejora6;
        contadorMejora6++;
        monedasJugador = monedasJugador - precio2Mejora6;
      }

      if (contadorMejora6 == 2 && monedasJugador > precio3Mejora6) {
        mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 37.5% de probabilidad de q la bomba explote
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        setState(() {
          if (rngBomba == 0) {
            vida = vida - vida;
          }
        });
        mejora6V3 = true;
        contadorMejora6++;
        monedasJugador = monedasJugador - precio3Mejora6;
      }
      if (contadorMejora6 > 2 && monedasJugador > precio3Mejora6) {
        mostrarMejoraComprada(context);
        mostrarMejoraComprada(context);
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        setState(() {
          if (rngBomba == 0) {
            vida = vida - vida;
          }
        });

        monedasJugador = monedasJugador - precio3Mejora6;
      }
    }

    //Mejora7

    void mejora7() {
      if (contadorMejora7 == 0 && monedasJugador > precio1Mejora7) {
        mostrarMejoraComprada(context);
        setState(() {
          //Actualizamos el numero de bombas que tenemos
          bombas = bombas + cantidadBombasV1;
        });
        //Actualizamos el precio del jugador
        monedasJugador = monedasJugador - precio1Mejora7;
        //Actualizamos el precio de la mejora
        precioMejoraGlobal7 = precio2Mejora7;
        mejora7V1 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 == 1 && monedasJugador > precio2Mejora7) {
        mostrarMejoraComprada(context);
        setState(() {
          //Actualizamos el numero de bombas que tenemos
          bombas = bombas + cantidadBombasV2;
        });
        //Actualizamos el precio del jugador
        monedasJugador = monedasJugador - precio2Mejora7;
        //Actualizamos el precio de la mejora
        precioMejoraGlobal7 = precio3Mejora7;
        mejora7V2 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 == 2 && monedasJugador > precio3Mejora7) {
        mostrarMejoraComprada(context);
        mostrarMaximaMejora(context);
        setState(() {
          //Actualizamos el numero de bombas que tenemos
          bombas = bombas + cantidadBombasV3;
        });
        //Actualizamos el precio del jugador
        monedasJugador = monedasJugador - precio3Mejora7;
        mejora7V3 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 > 2 && monedasJugador > precio3Mejora7) {
        setState(() {
          bombas = cantidadBombasV3;
        });
        monedasJugador = monedasJugador - precio3Mejora7;
      }
    }

    //Mejora 8
    void mejora8() {
      if (contadorMejora8 == 0 && monedasJugador > precio1Mejora8) {
        mostrarMejoraComprada(context);
        monedasJugador = monedasJugador - precio1Mejora8;
        contadorMejora8++;
        precioMejoraGlobal8 = precio2Mejora8;
        mejora8Utilizada = false;
      }
    }

    //Mejora 9
    void mejora9() {
      if (contadorMejora9 == 0 && monedasJugador > precio1Mejora9) {
        mejora9V1 = true;
        setState(() {
          //Actualizamos el precio de la mejora
          precioMejoraGlobal9 = precio2Mejora9;
          monedasJugador = monedasJugador - precio1Mejora9;
        });
        contadorMejora9++;
        mostrarMejoraComprada(context);
        escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV1 == true) {
            //Empiza la tormenta
            duracionTormentaV1++;

            setState(() {
              //Le restamos el daño que hara por segundo la lluvia helada
              vida = vida - danoHielo;
            });
            //El tiempo de duracion de la tormenta sera de treinte segundos
            if (duracionTormentaV1 == 30) {
              //Indicamos que la lluvia helada ha parado
              lluviaHeladaV1 = false;
              escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 == 1 && monedasJugador > precio2Mejora9) {
        mejora9V2 = true;
        mostrarMejoraComprada(context);
        setState(() {
          precioMejoraGlobal9 = precio3Mejora9;
          monedasJugador = monedasJugador - precio2Mejora9;
        });
        contadorMejora9++;
        escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV2 == true) {
            //Empiza la tormenta
            duracionTormentaV2++;

            setState(() {
              vida = vida - danoHielo;
            });
            //La duracion de la tormenta sera de sesenta segundos
            if (duracionTormentaV2 == 60) {
              lluviaHeladaV2 = false;
              escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 == 2 && monedasJugador > precio3Mejora9) {
        mejora9V3 = true;
        mostrarMejoraComprada(context);
        mostrarMaximaMejora(context);
        setState(() {
          monedasJugador = monedasJugador - precio3Mejora9;
        });
        contadorMejora9++;
        escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV3 == true) {
            //Empiza la tormenta
            duracionTormentaV3++;

            setState(() {
              vida = vida - danoHielo;
            });
            // La duracion de la tormenta sera de un minuto y medio
            if (duracionTormentaV3 == 90) {
              lluviaHeladaV3 = false;
              //Reseteamos para que cuando el jugador compre de nuevo la mejora el contador empiece de nuevo
              duracionTormentaV3 = 0;
              escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 > 2 && monedasJugador > precio3Mejora9) {
        mostrarMejoraComprada(context);
        setState(() {
          monedasJugador = monedasJugador - precio3Mejora9;
        });
        contadorMejora9++;
        escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV3 == true) {
            //Empiza la tormenta
            duracionTormentaV3++;

            setState(() {
              vida = vida - danoHielo;
            });

            if (duracionTormentaV3 == 90) {
              lluviaHeladaV3 = false;
              escarchaOF(context);
            }
          }
        });
      }
    }

    void usarBomba() {
      if (bombas > 0) {
        setState(() {
          //Al usar la bomba se le quitara vida al monstruo
          vida = vida - danoBomba;
          bombas = bombas - 1;
        });
      }
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

    //Funciones de mejora 1 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora1() {
      if (mejora1V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora1() {
      if (mejora1V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora1() {
      if (mejora1V3) {
        return verde;
      }
      return transparent;
    }

    //Fuciones de mejora 2 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora2() {
      if (mejora2V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora2() {
      if (mejora2V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora2() {
      if (mejora2V3) {
        return verde;
      }
      return transparent;
    }

    //Funciones de mejora 3 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora3() {
      if (mejora3V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora3() {
      if (mejora3V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora3() {
      if (mejora3V3) {
        return verde;
      }
      return transparent;
    }

    //Funciones de mejora 4 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora4() {
      if (mejora4V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora4() {
      if (mejora4V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora4() {
      if (mejora4V3) {
        return verde;
      }
      return transparent;
    }

    //Funciones de mejora 5 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora5() {
      if (mejora5V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora5() {
      if (mejora5V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora5() {
      if (mejora5V3) {
        return verde;
      }
      return transparent;
    }

    //Funciones de mejora 6 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora6() {
      if (mejora6V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora6() {
      if (mejora6V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora6() {
      if (mejora6V3) {
        return verde;
      }
      return transparent;
    }

    //Funciones de mejora 7 para mostrar el estado de nivel por pantalla
    Color incremento1Mejora7() {
      if (mejora7V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora7() {
      if (mejora7V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora7() {
      if (mejora7V3) {
        return verde;
      }
      return transparent;
    }

    Color incremento1Mejora9() {
      if (mejora9V1) {
        return verde;
      }
      return transparent;
    }

    Color incremento2Mejora9() {
      if (mejora9V2) {
        return verde;
      }
      return transparent;
    }

    Color incremento3Mejora9() {
      if (mejora9V3) {
        return verde;
      }
      return transparent;
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
                            margin: EdgeInsets.all(20),
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

                    Container(
                        margin: EdgeInsets.only(bottom: 0),
                        height: 27,
                        child: Text(
                            usuario.nombre.toString() +
                                " VS " +
                                listaMonstruos[contador].nombre,
                            style: TextStyle(
                                fontSize: 28,
                                color: colorLetras,
                                fontFamily: "caps"))),
                    //Container with monster´s image
                    Container(
                      margin: EdgeInsets.only(top: 0),
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
                        decoration: BoxDecoration(),
                        margin: EdgeInsets.only(top: 13, left: 10),
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(monedasJugador.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                          ),
                          Container(
                              width: 70,
                              height: 50,
                              child: Image.asset("assets/MonedasPrueba.png")),
                          Container(
                              margin: EdgeInsets.only(left: 40, top: 0),
                              child: Text(
                                bombas.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 5, top: 0),
                              child: InkWell(
                                child: Image.asset("assets/Bomba.png"),
                                onTap: () {
                                  usarBomba();
                                },
                              )),
                          Container(
                            width: 80,
                            height: 30,
                            margin: EdgeInsets.only(left: 30),
                            child: InkWell(
                              child: OutlinedButton(
                                child: Text("STATS"),
                                onPressed: (() {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: Row(
                                            children: [
                                              Container(
                                                height: alturaPantalla * 0.6,
                                                width: anchoPantalla * 0.79,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            "assets/Prueba1.gif"))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                          color: Colors
                                                              .brown[200]),
                                                      child: Text(
                                                          "Daño que se inflinge de forma pasiva: " +
                                                              mostrarDanoDps
                                                                  .toString() +
                                                              " de daño por segundo"),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black),
                                                          color: Colors
                                                              .brown[200]),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                }),
                              ),
                            ),
                          )
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
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/espada1.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora1(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora1(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora1(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),

                                //Container donde esta la imagen
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 160,
                                    height: 120,
                                    child: InkWell(
                                      onTap: () {
                                        mejora1();
                                        print(valorMejora);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                //Este container contendra la fila
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Espada1",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 30,
                          ),
                          //Container del segundo item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/arco.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora2(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora2(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora2(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 10),
                                    width: 140,
                                    height: 110,
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
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Arco",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal2.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del tercer item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/DañoPasiva.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora3(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora3(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora3(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 20),
                                    width: 140,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () {
                                        if (contadorMejora3 == 0 &&
                                            monedasJugador >= precio1Mejora3) {
                                          mejora3V1 = true;
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
                                            monedasJugador >= precio2Mejora3) {
                                          mejora3V2 = true;
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
                                            monedasJugador >= precio3Mejora3) {
                                          mejora3V3 = true;
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
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("?????",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal3.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del cuarto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/BolaFuego.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora4(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora4(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora4(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 120,
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
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal4.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del quinto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/ImagenAleatoria.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora5(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora5(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora5(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 4),
                                    width: 120,
                                    height: 116,
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
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal5.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del sexto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            10,
                                                                        left: 0,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/Calavera1.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora6(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora6(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora6(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 4),
                                    width: 140,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                        mejora6();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Calavera1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal6.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del septimo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            5,
                                                                        left: 4,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/Bomba.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora7(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora7(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora7(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 5),
                                    width: 110,
                                    height: 113,
                                    child: InkWell(
                                      onTap: () {
                                        mejora7();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Bomba.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 11, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal7.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del octavo item
                          Container(
                              width: 140,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0, top: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            5,
                                                                        left: 4,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/Bufo.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 0),
                                    width: 140,
                                    height: 130,
                                    child: InkWell(
                                      onTap: () {
                                        mejora8();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Bufo.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 0, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal7.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del noveno item
                          Container(
                              width: 140,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                              height: alturaPantalla *
                                                                  0.6,
                                                              width:
                                                                  anchoPantalla *
                                                                      0.79,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          "assets/Prueba1.gif"))),
                                                              child: Row(
                                                                children: [
                                                                  // Container para la imagen del item y sus bordes
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            5,
                                                                        left: 4,
                                                                        bottom:
                                                                            150),
                                                                    width: 100,
                                                                    height: 150,
                                                                    child: Image
                                                                        .asset(
                                                                            "assets/TormentaHielo.png"),
                                                                  ),
                                                                  // Container para el texto de explicación sobre el item
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black),
                                                                        color: Colors
                                                                            .brown[200]),
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            150),
                                                                    width: 180,
                                                                    height: 140,
                                                                    child: Text(
                                                                        "Espada: Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15)),
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento1Mejora9(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento2Mejora9(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incremento3Mejora9(),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 160,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                        mejora9();
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/TormentaHielo.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 11, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              precioMejoraGlobal9.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
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
                          //Container del decimo item
                          Container(
                              width: 140,
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
