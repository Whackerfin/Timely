import 'package:flutter/material.dart';
import "package:timely/scenes/home.dart";
import "package:timely/themes.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: myThemeLight, darkTheme: myThemeLight, home: HomeScreen());
  }
}
