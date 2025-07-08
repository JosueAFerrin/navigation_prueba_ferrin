import 'package:flutter/material.dart';
import 'edad_screen.dart';
import 'triangulo_screen.dart';
import 'api_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    EdadScreen(),
    TrianguloScreen(),
    ApiScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Edad"),
          BottomNavigationBarItem(icon: Icon(Icons.change_history), label: "Triángulo"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "API"),
        ],
      ),
    );
  }
}