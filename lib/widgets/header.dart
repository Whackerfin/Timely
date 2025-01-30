import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:timely/providers/actions_provider.dart";

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(height: 50),
      Text("Hey Timely When Should  I Wake up",
          style: Theme.of(context).textTheme.headlineSmall),
      SizedBox(height: 10),
      //Temporary for now
      Consumer<ActionProvider>(builder: (context, actions, child) {
        String currTime = actions.getTime();
        return Text(currTime, style: Theme.of(context).textTheme.displayLarge);
      })
    ]));
  }
}
