import 'dart:math';

class Mejoras {
  //Doble de ataque
  double mejora1(bool mejora1, double golpeSencillo) {
    if (mejora1 == true) {
      golpeSencillo = golpeSencillo * 2;
    }
    return golpeSencillo;
  }

  //Obtencion del doble de monedas
  int mejora2(bool mejora2, int monedasRecibidas) {
    if (mejora2 == true) {
      monedasRecibidas = monedasRecibidas * 2;
    }
    return monedasRecibidas;
  }

  //Aparicion de una imagen aleatoria en la pantalla
  String mejora4(bool mejora4) {
    String ruta = "assets/CofreTesoro.png";
    return ruta;
  }

  void mejora3(bool mejora3) {}
  void mejora5(bool mejora5) {}
  void mejora6(bool mejora6) {}
  void mejora7(bool mejora7) {}
  void mejora8(bool mejora8) {}
  void mejora9(bool mejora9) {}
}
