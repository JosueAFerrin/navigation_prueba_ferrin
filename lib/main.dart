import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_screen.dart';
import 'viewmodels/edad_viewmodel.dart';
import 'viewmodels/triangulo_viewmodel.dart';
import 'viewmodels/api_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EdadViewModel()),
        ChangeNotifierProvider(create: (_) => TrianguloViewModel()),
        ChangeNotifierProvider(create: (_) => ApiViewModel()),
      ],
      child: MaterialApp(
        title: 'Bottom Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
