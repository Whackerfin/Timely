import "package:flutter/material.dart";

class ActionModel {
  final String name;
  final IconData icon;
  final String duration;
  final String id;
  final int mins;
  const ActionModel(
      {required this.name,
      required this.id,
      required this.icon,
      required this.duration,
      required this.mins});
}
