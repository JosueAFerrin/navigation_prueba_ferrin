// lib/views/api_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/api_viewmodel.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiVM = Provider.of<ApiViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dato Curioso de Gatos')),
      body: Center(
        child: apiVM.loading
            ? const CircularProgressIndicator()
            : Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            apiVM.fact,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => apiVM.fetchCatFact(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
