import 'dart:math';

class Mejoras {
  //Doble de ataque
  void mejora1(bool mejora1, double golpeSencillo, int contadorMejora1,
      int monedasJugador, int precioMejora1) {
    if (mejora1 == true &&
        contadorMejora1 == 0 &&
        monedasJugador > precioMejora1) {
      golpeSencillo = golpeSencillo * 2;
      contadorMejora1++;
      monedasJugador = monedasJugador - precioMejora1;
    }
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
