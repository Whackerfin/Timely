import "package:flutter/material.dart";
import "package:timely/themes.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backgroundColorDarkStart, // Start color (you can adjust this based on your theme)
                backgroundColorDarkEnd, // End color (adjust as needed)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: Text("Hey there jake")) // Add your content here
          ),
    );
  }
}
