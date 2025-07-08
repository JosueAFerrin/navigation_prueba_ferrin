import 'package:flutter/material.dart';
import '../viewmodels/edad_viewmodel.dart';

class EdadScreen extends StatefulWidget {
  const EdadScreen({super.key});

  @override
  State<EdadScreen> createState() => _EdadScreenState();
}

class _EdadScreenState extends State<EdadScreen> {
  DateTime? selectedDate;
  String resultado = "";

  void calcularEdad() {
    if (selectedDate != null) {
      final viewModel = EdadViewModel();
      final edad = viewModel.calcularEdad(selectedDate!);
      setState(() {
        resultado = edad;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calcular Edad")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final fecha = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (fecha != null) {
                  setState(() {
                    selectedDate = fecha;
                  });
                }
              },
              child: const Text("Seleccionar Fecha de Nacimiento"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calcularEdad,
              child: const Text("Calcular"),
            ),
            const SizedBox(height: 20),
            Text(resultado, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}