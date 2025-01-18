import "package:flutter/material.dart";
import "package:timely/models/actionmodel.dart";
import 'package:intl/intl.dart';

class ActionProvider extends ChangeNotifier {
  final List<ActionModel> _actions = [];
  List<ActionModel> get actions => _actions;

  int _totalmins = 0;
  int get totalmins => _totalmins;
  String _readyTime = "8:30 AM";
  void setReadyTime(String a) {
    _readyTime = a;
    notifyListeners();
  }

  void setTotalTime({bool clear = false}) {
    if (clear) {
      _totalmins = 0;
      notifyListeners();
    }
  }

  String getTime() {
    DateFormat inputFormat = DateFormat('hh:mm a');
    DateTime now = DateTime.now(); // To use current date
    DateTime givenTime = inputFormat.parse(_readyTime);
    givenTime = DateTime(
        now.year, now.month, now.day, givenTime.hour, givenTime.minute);
    DateTime resultTime = givenTime.subtract(Duration(minutes: totalmins));
    DateFormat outputFormat = DateFormat('hh:mm a');
    String formattedTime = outputFormat.format(resultTime);
    return formattedTime;
  }

  void increaseTime(int time) {
    _totalmins += time;
    notifyListeners();
  }

  void add(ActionModel action) {
    _actions.add(action);
    notifyListeners();
  }

  void removeAll() {
    _actions.clear();
    notifyListeners();
  }
}
