import 'package:flutter/material.dart';
import 'views/roast_view.dart';

void main() {
  runApp(const CoffeeRoastApp());
}

class CoffeeRoastApp extends StatelessWidget {
  const CoffeeRoastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Roast Timer',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const RoastView(),
    );
  }
}