import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('John Doe'),
                  accountEmail: Text('johnd@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(
                      Icons.supervised_user_circle_rounded,
                      size: 72.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Inicio'),
                  trailing: Icon(
                    Icons.home,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Categorias'),
                ),
                ListTile(
                  title: Text('Productos'),
                ),
                ListTile(
                  title: Text('Clientes'),
                ),
                ListTile(
                  title: Text('Pedidos'),
                ),
              ],
            ),
          ),
          Divider(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              title: Text('Salir'),
            ),
          ),
        ],
      ),
    );
  }
}
