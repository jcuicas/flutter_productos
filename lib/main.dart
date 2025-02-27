import 'package:flutter/material.dart';
import 'package:productos/screens/home.dart';

void main() => runApp(const Produtos());

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  @override
  Widget build(BuildContext context) {
    const String tituloApp = 'Produtos';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: tituloApp,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: HomeScreen(
        titulo: tituloApp,
      ),
    );
  }
}
