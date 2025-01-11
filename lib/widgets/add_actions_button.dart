import "package:flutter/material.dart";

class AddActionsButton extends StatelessWidget {
  const AddActionsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0, bottom: 25.0),
        child: Row(children: <Widget>[
          Expanded(
              child: SizedBox(
                  height: 65.0,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
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
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ADD AN ACTION ",
                                style: Theme.of(context).textTheme.titleMedium),
                            Icon(Icons.keyboard_arrow_up,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 32.0),
                          ]))))
        ]));
  }
}
