import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;
  double get currentPage => this._currentPage;
// getter para obtener valor
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
