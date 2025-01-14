import "package:flutter/material.dart";
import "package:timely/models/actionmodel.dart";

class ActionProvider extends ChangeNotifier {
  final List<ActionModel> _actions = [
    ActionModel(name: "Breakfast", duration: "15mins", icon: Icons.local_pizza),
    ActionModel(name: "Breakfast", duration: "15mins", icon: Icons.local_pizza),
  ];
  List<ActionModel> get actions => _actions;
  void add(ActionModel action) {
    _actions.add(action);
    notifyListeners();
  }

  void removeAll() {
    _actions.clear();
    notifyListeners();
  }
}
