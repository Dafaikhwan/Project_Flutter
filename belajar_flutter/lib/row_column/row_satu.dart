import 'package:belajar_flutter/main_layout.dart';
import 'package:flutter/material.dart';

class RowSatu extends StatelessWidget {
  const RowSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Row',
      body: Row(
        mainAxisAlignment: MainAxisAlignment. spaceBetween,
        children: [
          Text('Widget Text 1'),
          Text('Widget Text 2'),
          Text('Widget Text 3'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('text 1')],
          )
        ],
      ),
    );
  }
}