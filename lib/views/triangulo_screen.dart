import 'package:flutter/material.dart';
import '../viewmodels/triangulo_viewmodel.dart';

class TrianguloScreen extends StatefulWidget {
  const TrianguloScreen({super.key});

  @override
  State<TrianguloScreen> createState() => _TrianguloScreenState();
}

class _TrianguloScreenState extends State<TrianguloScreen> {
  final ladoA = TextEditingController();
  final ladoB = TextEditingController();
  final ladoC = TextEditingController();
  String tipo = "";

  void verificarTipo() {
    final viewModel = TrianguloViewModel();
    setState(() {
      tipo = viewModel.tipoTriangulo(
        double.tryParse(ladoA.text) ?? 0,
        double.tryParse(ladoB.text) ?? 0,
        double.tryParse(ladoC.text) ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tipo de Triángulo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: ladoA, decoration: const InputDecoration(labelText: "Lado A")),
            TextField(controller: ladoB, decoration: const InputDecoration(labelText: "Lado B")),
            TextField(controller: ladoC, decoration: const InputDecoration(labelText: "Lado C")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: verificarTipo, child: const Text("Verificar")),
            const SizedBox(height: 20),
            Text(tipo, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}