// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, unnecessary_import

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mysql1/mysql1.dart';
// import 'package:http/http.dart' as http;

import 'datos.dart';
import 'main.dart';

class LoginStates extends StatefulWidget {
  @override
  LoginStatesState createState() => LoginStatesState();
}

class LoginStatesState extends State<LoginStates> {
  // //Creamos el objeto db que extendera de la clase Mysql
  // var db = new Mysql();
  // //Esta es la variable donde vamos a guardar la informacion que nos devolvera
  // //la BDD, en este caso como prueba le pedimos el nombre
  // // var nombre = "";

  // TextEditingController nombre = TextEditingController();
  // TextEditingController monedas = TextEditingController(); 
 
  // Future<void> insertConsulta() async {
  //   //Si los campos estan vacios entonces se puede realiar el insert
  //   if(nombre.text == "" || monedas.text == ""){
  //      try{
  //       String url = "http://10.0.2.2/CLICKER/consultas.php";
  //       var res = await http.post(Uri.parse(url), body: {
  //         "nombre": nombre.text,
  //         "monedas": monedas.text
  //       });
  //       // var response = jsonDecode(res.body);
  //       // if(response["exito"] == "true"){
  //       //   print("Insertado con exito");
  //       // }
  //       // else{
  //       //   print("Problemitas en el paraiso");
  //       // }
  //       }catch(e){
  //       print(e);
  //      }
  //      //Si contienen valores le indicamos un mensaje de error
  //   }
  //     else{
  //     print("Los campos ya estan ocupados");
  //   }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              title: Text("Ranking"),
              leading: Icon(Icons.integration_instructions),
            ),
            ListTile(
              title: Text("Contacto DEVS"),
              leading: Icon(Icons.integration_instructions),
            ),
          ])),
      body: Center(
        child: Column(
          children: [
            //Contenedor nombre
            Container(
              
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)
                
              ),
              margin: EdgeInsets.only(left: 750, right: 750, top: 150),
              child: Form(
                
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Es necesario ingresar un nombre";
                    }
                  }
                  // controller: nombre
                ),
              ),
            ),
             Container(
              decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
              ),
              margin: EdgeInsets.only(left: 750, right: 750, top: 50),
              child: Form(
                child: TextFormField(
                   validator: (value){
                    if(value!.isEmpty){
                      return "Es necesario ingresar una contraseña";
                      }
                  }
                  // controller: monedas
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 50),
              child: FloatingActionButton( onPressed: () {
              login(context);
              },
              child:Text("Login"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50,),
              child: FloatingActionButton( onPressed: () {
              login(context);
              },
              child:Text("Register", style: Size,),
            

              
              ),
            )
          ],
        ),
      ),

      //Container(child: LoginStates()),
    );
  }

  // void comparaUsuario() {
  //   String nombreComparar;
  //   db.getConnection().then((conn) {
  //     String sqlConsulta = "select nombre from usuarios";
  //     conn.query(sqlConsulta).then((results) {
  //       for (var row in results) {
  //         for (int i = 0; i > results.length; i++) {
  //           nombreComparar = row[i];
  //           if (nombre == nombreComparar) {
  //             funcionLogin();
  //           } else {
  //             setState(() {
  //               nombre = row[i];
  //             });
  //             funcionRegistrar();
  //           }
  //         }
  //       }
  //     });
  //   });
  // }

  // void funcionLogin() {}

  // void funcionRegistrar() {
  //   db.getConnection().then((conn) {
  //     String sqlConsulta1 =
  //         "insert into usuarios (nombre) values ('esto es una prueba2')";
  //     conn.query(sqlConsulta1).then((results) {});
  //   });
  // }
  void login(BuildContext context) {
    
       Navigator.of(context).pushNamed("/Clicker");
    

}

}





