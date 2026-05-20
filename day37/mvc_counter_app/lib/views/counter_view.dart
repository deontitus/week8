import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  final CounterController controller = CounterController();

  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVC Counter App"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "Counter Value",
              style: TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${controller.counterValue}",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                FloatingActionButton(
                  onPressed: () {
                    controller.decrement();
                    updateUI();
                  },
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(width: 20),

                FloatingActionButton(
                  onPressed: () {
                    controller.increment();
                    updateUI();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                controller.reset();
                updateUI();
              },

              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}