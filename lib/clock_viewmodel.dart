import 'dart:async';

import 'package:flutter/material.dart';

class ClockViewmodel extends ChangeNotifier {
  DateTime? _currentTime;
  DateTime get currentTime => _currentTime ?? DateTime.now();
  clock() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _currentTime = DateTime.now();
      notifyListeners();
    });
  }
}
