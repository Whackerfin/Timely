import 'package:flutter/material.dart';
import "package:timely/providers/actions_provider.dart";
import "package:timely/scenes/home.dart";
import "package:timely/themes.dart";
import "package:provider/provider.dart";

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ActionProvider()..initialize(),
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: myThemeLight,
        darkTheme: myThemeDark,
        home: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: HomeScreen()));
  }
}
