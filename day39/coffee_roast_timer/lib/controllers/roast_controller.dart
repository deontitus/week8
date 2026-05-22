import 'dart:async';
import 'package:flutter/material.dart';

class RoastController extends ChangeNotifier {
  int seconds = 0;

  Timer? _timer;

  String roastStage = "Green";

  Color roastColor = Colors.green;

  void startRoasting() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds < 50) {
        seconds++;
        _updateRoast();
      } else {
        timer.cancel();
      }
    });
  }

  void _updateRoast() {
    if (seconds <= 20) {
      roastStage = "Green";
      roastColor = Colors.green;
    } else if (seconds <= 30) {
      roastStage = "Light Brown";
      roastColor = Colors.brown.shade300;
    } else if (seconds <= 40) {
      roastStage = "Brown";
      roastColor = Colors.brown;
    } else {
      roastStage = "Dark Brown";
      roastColor = Colors.brown.shade900;
    }

    notifyListeners();
  }

  void forwardStage() {
    if (seconds < 50) {
      seconds += 10;

      if (seconds > 50) {
        seconds = 50;
      }

      _updateRoast();
    }
  }

  void backStage() {
    if (seconds > 0) {
      seconds -= 10;

      if (seconds < 0) {
        seconds = 0;
      }

      _updateRoast();
    }
  }

  void resetRoast() {
    _timer?.cancel();

    seconds = 0;
    roastStage = "Green";
    roastColor = Colors.green;

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}