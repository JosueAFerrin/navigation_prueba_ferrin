import 'package:flutter/material.dart';

class TrianguloViewModel extends ChangeNotifier {
  String tipoTriangulo(double a, double b, double c) {
    if (a <= 0 || b <= 0 || c <= 0) return "Lados inválidos";

    if (a == b && b == c) return "Equilátero";
    if (a == b || b == c || a == c) return "Isósceles";
    return "Escaleno";
  }
}
