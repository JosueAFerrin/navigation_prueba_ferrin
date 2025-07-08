// lib/viewmodels/api_viewmodel.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiViewModel extends ChangeNotifier {
  String _fact = '';
  String get fact => _fact;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchCatFact() async {
    _loading = true;
    notifyListeners();

    final url = Uri.parse('https://catfact.ninja/fact');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _fact = data['fact'] ?? 'No hay dato';
      } else {
        _fact = 'Error: Código ${response.statusCode}';
      }
    } catch (e) {
      _fact = 'Error al cargar API: $e';
    }

    _loading = false;
    notifyListeners();
  }
}
