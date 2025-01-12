import "package:flutter/material.dart";

class ActionsForm extends StatelessWidget {
  final VoidCallback onPressed;
  const ActionsForm({required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 26.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0)),
        child: Column(children: [
          SizedBox(
              width: double.infinity,
              height: 65.0,
              child: TextButton.icon(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero))),
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(180);
                      }
                      return Theme.of(context)
                          .colorScheme
                          .secondary; // Use the component's default.
                    },
                  ),
                ),
                onPressed: onPressed,
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 32.0),
                label: Text("ADD AN ACTION ",
                    style: Theme.of(context).textTheme.titleMedium),
              )),
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
