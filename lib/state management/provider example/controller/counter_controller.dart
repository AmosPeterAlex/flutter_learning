import 'package:advanced_flutter/state%20management/provider%20example/model/count.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  Count _incrementCounter = Count(0);

  Count get counterValue => _incrementCounter;

  void incrementCount() {
    _incrementCounter.value++;
    notifyListeners();
  }
}
