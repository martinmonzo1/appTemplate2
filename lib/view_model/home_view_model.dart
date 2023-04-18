import 'package:app_template/model/api.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {

  int counter = 0;

  Future<void> incrementCounter() async {
    try {
      String response = await API.getResponse('incrementCounter');
      counter ++;
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}