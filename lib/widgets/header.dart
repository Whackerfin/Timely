import "package:flutter/material.dart";

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text("Hey Timely When Should  I Wake up",
          style: Theme.of(context).textTheme.headlineSmall),
      SizedBox(height: 25),
      //Temporary for now
      Text("6:00 AM", style: Theme.of(context).textTheme.displayLarge)
    ]));
  }
}
