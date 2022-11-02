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
  @override
  int contador = 100;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clicker")),
      body: Center(
        child: Column(children: [
          InkWell(
            onTap: () {
              disminuir();
            },
            child: Container(
              child: FadeInImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515__340.png'),
                  placeholder: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/02/09/21/08/wings-2053515__340.png')),
            ),
          ),
          Text("AQUI SE CUENTA + " + contador.toString()),
        ]),
      ),
    );
  }

  void disminuir() {
    setState(() {
      contador--;
    });
  }
}
