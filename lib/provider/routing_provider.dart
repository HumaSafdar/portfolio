import 'package:flutter/widgets.dart';

class RoutingProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get getindex => _currentIndex;

  void setindex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  changeindex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
