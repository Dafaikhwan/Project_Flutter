import 'package:belajar_flutter/main_layout.dart';
import 'package:flutter/material.dart';

class ListViewSatu extends StatelessWidget {
  const ListViewSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'list view basic',
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.amber[100],
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
           Container(
            color: Colors.amber[200],
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
           Container(
            color: Colors.amber[300],
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
          Container(
            color: Colors.amber[400],
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
          Container(
            color: Colors.amber[500],
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.all(10),
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}