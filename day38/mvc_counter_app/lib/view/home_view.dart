import 'package:flutter/material.dart';
import '../controller/counter_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CounterController controller = CounterController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
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
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${controller.count}",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 25),
                  ),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                controller.reset();
              },
              child: const Text(
                "Reset",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}