// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:clicker/mundos.dart';
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

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
 


  @override
  Widget build(BuildContext context) {

    //Variables para cambiar de monstruo
    int indicador =1;
    int contador =0;
    //Variable para recoger la vida del monstruo
    int vida=0;
    
    // Lista de monstruos y los objetos monstruo creados
     
    monstruo monstruo1 = monstruo(nombre: "Pablo", vida: 1000, imagenRuta: "assets/pequeñoCola1.png", identificador: 1);
    monstruo monstruo2 = monstruo(nombre: "Daniel", vida: 2000, imagenRuta: "assets/monstruo2.png", identificador: 2);
    monstruo monstruo3 = monstruo(nombre: "Nelson", vida: 4000, imagenRuta: "assets/plantaCarnivora3.png", identificador: 3);
  
    List <monstruo> listaMonstruos =[monstruo1,monstruo2,monstruo3];

    // Funcion para restar vida en funcion a clicks
    // Resto 1 de vida por click
    // En el primer if, cuando vida llegue a 0, contador suma 1 vez, como hay 3 monstruos por mundo, 
    // cuando ese contador sea 3, indicador que es la variable que nos dice en que mundo estamos,
    // suma 1, para indicarnos que hemos pasado al siguiente mundo

    void vidaResta(){
      vida--;
      
      if(vida==0){
        setState(() {
          contador ++;
        });
       
      }
      if(contador==3){

        setState(() {
          indicador++;
          contador =0;
        }); 

      }

    }


    // De la lista de monstruos, comparo la variable mundo con el indicador, si son iguales 
    String  seleccionarImagen(){
      
      String rutaImagen1="";
      monstruo monstruoComparacion;
        for(int i =0; i<listaMonstruos.length;i++){
          monstruoComparacion=listaMonstruos[i];
          if(monstruoComparacion.identificador==indicador){
            rutaImagen1=monstruoComparacion.imagenRuta;
          }
          
          }

        return rutaImagen1;
    }


    // FUNCION EN CONSTRUCCION PARA SELECCIONAR EL MONSTRUO
    //     monstruo seleccionarMonstruo(){
    //     monstruo monstruoSeleccionado;
    //     // Parte para la bbdd y recuperar partida con vuestro anterior




    //     // Parte para la bbdd y recuperar partida con vuestro anterior

    //     for(int i =0; i<listaMonstruos.length;i++){



    //     }

    //    return monstruoSeleccionado;
    //  }

    
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
            // vidaResta();
            },
            // ignore: sized_box_for_whitespace
            child: Container(
          // ignore: prefer_const_constructors 
            child:Image.asset(seleccionarImagen()),
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

