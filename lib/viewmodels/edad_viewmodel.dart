import 'package:flutter/material.dart';

class EdadViewModel extends ChangeNotifier {
  String calcularEdad(DateTime nacimiento) {
    final hoy = DateTime.now();
    int anios = hoy.year - nacimiento.year;
    int meses = hoy.month - nacimiento.month;
    int dias = hoy.day - nacimiento.day;

    if (dias < 0) {
      meses -= 1;
      dias += DateTime(hoy.year, hoy.month, 0).day;
    }

    if (meses < 0) {
      anios -= 1;
      meses += 12;
    }

    return "$anios años, $meses meses, $dias días";
  }
}
