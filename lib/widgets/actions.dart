import "package:flutter/material.dart";

class ActionCard extends StatelessWidget {
  final String name;
  final String duration;
  const ActionCard({required this.name, required this.duration, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 1.0,
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(children: [
                  Expanded(
                      child: Text(name,
                          style: Theme.of(context).textTheme.bodyMedium)),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: Text(duration,
                          style: Theme.of(context).textTheme.titleSmall))
                ]))));
  }
}
