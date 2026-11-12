import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/datos_nino/datos_nino_screen.dart';

void main() {
  runApp(const ProviderScope(child: CarsApp()));
}

class CarsApp extends StatelessWidget {
  const CarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARS2 App',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DatosNinoScreen(),
    );
  }
}
