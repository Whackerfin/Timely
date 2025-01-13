import "package:flutter/material.dart";

class ActionsForm extends StatelessWidget {
  const ActionsForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 26.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0))),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                        style: Theme.of(context).textTheme.titleLarge),
                    Text("Icon", style: Theme.of(context).textTheme.titleLarge),
                    Text("Duration",
                        style: Theme.of(context).textTheme.titleLarge),
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
              ]))
        ]));
  }
}
