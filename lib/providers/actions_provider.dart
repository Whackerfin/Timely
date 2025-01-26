import "package:flutter/material.dart";
import "package:timely/models/actionmodel.dart";
import 'package:intl/intl.dart';
import "package:timely/services/database_services.dart";

class ActionProvider extends ChangeNotifier {
  List<ActionModel> _actions = [];
  List<ActionModel> get actions {
    return _actions;
  }

  final DatabaseService _databaseService = DatabaseService.instance;
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
    try {
      _readyTime = _readyTime.trim();
      if (!_readyTime.contains(RegExp(r'\b[APap][Mm]\b'))) {
        _readyTime = _readyTime + " AM";
      }
      DateFormat inputFormat = DateFormat('hh:mm a', "en_US");
      DateTime now = DateTime.now(); // To use current date
      DateTime givenTime = inputFormat.parse(_readyTime);
      givenTime = DateTime(
          now.year, now.month, now.day, givenTime.hour, givenTime.minute);
      DateTime resultTime = givenTime.subtract(Duration(minutes: totalmins));
      DateFormat outputFormat = DateFormat('hh:mm a');
      String formattedTime = outputFormat.format(resultTime);

      return formattedTime;
    } catch (e) {
      print("Error parsing time: $e");
      return "Invalid Time Format";
    }
  }

  void increaseTime(int time) {
    _totalmins += time;
    notifyListeners();
  }

  void add(ActionModel action) {
    int l = _actions.length;
    _databaseService.addAction(action, l);
    _actions.add(action);
    notifyListeners();
  }

  void removeAt(int index) {
    _totalmins -= _actions[index].mins;
    _databaseService.removeActionAtIndex(index);
    _actions.removeAt(index);
    notifyListeners();
  }

  void insertAt(int index, ActionModel model) {
    _totalmins += model.mins;
    _databaseService.insertActionAtIndex(model, index);
    _actions.insert(index, model);
    notifyListeners();
  }

  void removeAll() {
    _databaseService.deleteAllRows();
    _actions.clear();
    notifyListeners();
  }

  Future<void> initialize() async {
    _actions = await _databaseService.getActions();
    print("Initialized");
  }

  Future<void> updateOrderInDatabase() async {
    for (int i = 0; i < _actions.length; i++) {
      final action = _actions[i];
      await _databaseService.updateActionOrder(
          action.id, i); // Updates the action_order for each action
    }
  }
}
