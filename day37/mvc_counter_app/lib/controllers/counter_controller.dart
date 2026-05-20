import '../models/counter_model.dart';

class CounterController {
  final CounterModel _model = CounterModel();

  int get counterValue => _model.count;

  void increment() {
    _model.count++;
  }

  void decrement() {
    _model.count--;
  }

  void reset() {
    _model.count = 0;
  }
}