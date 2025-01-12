import "package:timely/widgets/actions.dart";
import "package:flutter/material.dart";

class ActionsList extends StatelessWidget {
  const ActionsList({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Expanded(
            child: Ink(
                padding: EdgeInsets.only(top: 67.0, bottom: 10.0),
                child: ListView(
                  children: <Widget>[
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                    ActionCard(
                        name: "Breakfast",
                        duration: "15mins",
                        icon: Icons.local_pizza),
                  ],
                ))));
  }
}
