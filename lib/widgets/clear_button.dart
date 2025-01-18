import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:timely/providers/actions_provider.dart";

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 50.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Theme.of(context)
                            .colorScheme
                            .error
                            .withAlpha(180);
                      }
                      return Theme.of(context)
                          .colorScheme
                          .error; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {
                  Provider.of<ActionProvider>(context, listen: false)
                      .removeAll();
                  Provider.of<ActionProvider>(context, listen: false)
                      .setTotalTime(clear: true);
                },
                child: Text("CLEAR",
                    style: Theme.of(context).textTheme.bodySmall))));
  }
}
