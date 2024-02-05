import 'package:advanced_flutter/state%20management/provider%20example/model/count.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  final Count _changeCounter = Count(0);

  Count get counterValue => _changeCounter;

  void incrementCount() {
    _changeCounter.value++;
    notifyListeners();
  }
  void decrementCount(){
    _changeCounter.value--;
    notifyListeners();
  }
}
