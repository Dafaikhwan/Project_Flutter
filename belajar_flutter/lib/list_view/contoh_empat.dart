import 'package:flutter/material.dart';
import 'package:belajar_flutter/main_layout.dart';

class ListItem {
  final Color color;
  final String text;

  ListItem(this.color, this.text);
}

class ListViewEmpat extends StatelessWidget {
  const ListViewEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    // itemList dipindahkan ke dalam build() agar tidak bentrok dengan const constructor
    final List<ListItem> itemList = [
      ListItem(Colors.red, 'Partai Banteng'),
      ListItem(Colors.green, 'Partai Kabah'),
      ListItem(Colors.blue, 'Partai Joget'),
      
    ];

    return MainLayout(
      title: 'ListView Separated',
      body: SizedBox(
        height: double.infinity,
        child: ListView.separated(
          itemCount: itemList.length,
          separatorBuilder: (context, index) => const Divider(color: Colors.black),
          itemBuilder: (context, index) {
            final item = itemList[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item.text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
