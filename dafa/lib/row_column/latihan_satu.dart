import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {
  const LatihanSatu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
          FlutterLogo(size:50, textColor:Colors.pink),
          FlutterLogo(size:50, textColor:Colors.orange),
          FlutterLogo(size:50, textColor:Colors.blue),
        ],
      ),
      FlutterLogo(size:50, textColor:Colors.pink),
      FlutterLogo(size:50, textColor:Colors.orange),
      FlutterLogo(size:50, textColor:Colors.blue),
       ],
      ),
    );
  }
}
  
