import 'package:flutter/material.dart';
import '../controllers/roast_controller.dart';

class RoastView extends StatefulWidget {
  const RoastView({super.key});

  @override
  State<RoastView> createState() => _RoastViewState();
}

class _RoastViewState extends State<RoastView> {
  final RoastController controller = RoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Roast Timer"),
        centerTitle: true,
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: controller.roastColor,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  "Time: ${controller.seconds} s",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  controller.roastStage,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.startRoasting,
                      child: const Text("Start Roasting"),
                    ),

                    ElevatedButton(
                      onPressed: controller.forwardStage,
                      child: const Text("Forward"),
                    ),

                    ElevatedButton(
                      onPressed: controller.backStage,
                      child: const Text("Back"),
                    ),

                    ElevatedButton(
                      onPressed: controller.resetRoast,
                      child: const Text("Reset"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}