import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter View")),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Angka
              Text(
                "${c.count.value}",
                style: TextStyle(
                  fontSize: 30 + c.count.value.toDouble(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Tombol bundar + dan -
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.small(
                    heroTag: "minus",
                    backgroundColor: Colors.red,
                    onPressed: () => c.decrement(),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                  const SizedBox(width: 30),
                  FloatingActionButton.small(
                    heroTag: "plus",
                    backgroundColor: Colors.green,
                    onPressed: () => c.increment(),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
