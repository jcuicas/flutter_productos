import 'package:flutter/material.dart';
import 'package:productos/components/my_drawer.dart';

class Dashboard extends StatefulWidget {
  final String titulo;
  //final String userName;
  final String accessToken;

  const Dashboard({
    super.key,
    required this.titulo,
    //required this.userName,
    required this.accessToken,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            padding: EdgeInsets.only(top: 6.0, left: 3.0),
            child: Card(
              color: Color(0xffffffff),
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  'Categorias',
                  textAlign: TextAlign.center,
                ),
                subtitle: Image.asset('assets/img/categories.png'),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
