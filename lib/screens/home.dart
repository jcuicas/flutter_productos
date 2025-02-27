import 'package:flutter/material.dart';
import 'package:productos/screens/login.dart';

class HomeScreen extends StatefulWidget {
  final String titulo;

  const HomeScreen({
    super.key,
    required this.titulo,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(titulo: widget.titulo),
      backgroundColor: Colors.blueGrey[100],
    );
  }
}
