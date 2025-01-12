import "package:flutter/material.dart";

class ActionsForm extends StatelessWidget {
  final VoidCallback onPressed;
  const ActionsForm({required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(26.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("ADD AN ACTION ",
                style: Theme.of(context).textTheme.titleMedium),
            IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 32.0)),
          ]),
          Row(children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title", style: Theme.of(context).textTheme.titleLarge),
                Text("Icon", style: Theme.of(context).textTheme.titleLarge),
                Text("Duration", style: Theme.of(context).textTheme.titleLarge),
              ],
            )),
            Container(
                height: 129,
                padding: EdgeInsets.only(bottom: 10.0),
                alignment: Alignment.bottomCenter,
                child: Icon(
                  size: 32,
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondary,
                ))
          ])
        ]));
  }
}
