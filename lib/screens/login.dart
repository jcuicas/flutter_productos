import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos/models/auth.dart';
import 'package:http/http.dart' as http;
import 'package:productos/screens/dashboard.dart';

class Login extends StatefulWidget {
  final String titulo;

  const Login({
    super.key,
    required this.titulo,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool passwordVisible;
  late Future<Auth> loginUser;

  final userName = TextEditingController();
  final passwordUser = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    passwordUser.dispose();

    super.dispose();
  }

  void toogle() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void initState() {
    super.initState();

    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: cuerpo(),
      backgroundColor: Colors.blueGrey[100],
    );
  }

  Widget cuerpo() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titulo(),
          const SizedBox(
            height: 20.0,
          ),
          username(),
          clave(),
          const SizedBox(
            height: 22.0,
          ),
          entrar(),
        ],
      ),
    );
  }

  Widget titulo() {
    return const Text(
      'Inicio de sesión',
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      child: TextField(
        controller: userName,
        decoration: const InputDecoration(
          hintText: 'Escribe el nombre del usuario',
        ),
        autofocus: true,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget clave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      child: TextField(
        controller: passwordUser,
        decoration: InputDecoration(
          hintText: 'Escribe la contraseña',
          suffixIcon: IconButton(
            onPressed: () {
              toogle();
            },
            icon:
                Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
            color: Theme.of(context).primaryColor,
          ),
        ),
        obscureText: passwordVisible,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget entrar() {
    return ElevatedButton.icon(
      onPressed: () {
        loginUser = authUser();
        loginUser.then(
          (value) => {
            value.accessToken.isNotEmpty
                ? goDashboard(
                    value.accessToken,
                  )
                : msgErrorLogin()
          },
        );
      },
      icon: const Icon(Icons.login_rounded),
      label: const Text(
        'Entrar',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Future<Auth> authUser() async {
    try {
      final response = await http.post(
        Uri.parse('https://fakestoreapi.com/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'username': userName.text,
          'password': passwordUser.text,
        }),
      );

      if (response.statusCode == 200) {
        return Auth.fromJson(response.body);
      } else {
        return const Auth(
          accessToken: '',
        );
      }
    } catch (ex) {
      return const Auth(
        accessToken: '',
      );
    }
  }

  void goDashboard(String accessToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard(
          titulo: widget.titulo,
          accessToken: accessToken,
        ),
      ),
    );
  }

  void msgErrorLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Aviso importante'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Credenciales no registradas'),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check_circle),
            label: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
