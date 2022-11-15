import 'dart:async';

import 'package:mysql1/mysql1.dart';

class Mysql {
  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: "", port: 3306, user: "", password: "", db: "");
    return await MySqlConnection.connect(settings);
  }
}
//Enlace de donde saque la informacion:
// https://www.youtube.com/watch?v=ig6WRq73iEg