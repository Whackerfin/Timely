import "package:flutter/material.dart";
import "package:timely/themes.dart";
import "package:timely/widgets/header.dart";
import "package:timely/widgets/actions.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
      return Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: isDarkMode
              ? BoxDecoration(
                  gradient: LinearGradient(
                  colors: [
                    backgroundColorDarkStart, // Start color (you can adjust this based on your theme)
                    backgroundColorDarkEnd, // End color (adjust as needed)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ))
              : null,
          child: Column(children: <Widget>[
            Header(),
            ActionCard(name: "Breakfast", duration: "15mins")
          ]));
    }));
  }
}
