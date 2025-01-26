import "package:flutter/material.dart";
import "package:timely/colors.dart";
import "package:timely/widgets/add_actions_button.dart";
import "package:timely/widgets/clear_button.dart";
import "package:timely/widgets/footer.dart";
import "package:timely/widgets/header.dart";
import "package:timely/widgets/actions_list.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Builder(builder: (context) {
          final isDarkMode = Theme.of(context).brightness == Brightness.dark;
          return Ink(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40.0),
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
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(children: <Widget>[
                  Header(),
                  ActionsList(),
                  ClearButton(),
                  AddActionsButton(),
                  Footer(),
                ]);
              }));
        }));
  }
}
