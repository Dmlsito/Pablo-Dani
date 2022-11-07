import 'dart:async';
import 'package:mysql1/mysql1.dart';

class Mysql {
  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: "aws-eu-west-2.connect.psdb.cloud",
        port: 3306,
        user: "c6x9qp3c8s6plywpvv7b",
        password: "pscale_pw_y4ZSRbYVl6A1IOXUlNh6toLkqEHoGi5URjnK7cdZLbw",
        db: " nelsonesmipadredb");
    return await MySqlConnection.connect(settings);
  }
}
//Enlace de donde saque la informacion:
//https://www.youtube.com/watch?v=ig6WRq73iEg