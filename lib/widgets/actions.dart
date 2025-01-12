import "package:flutter/material.dart";
import "package:timely/colors.dart";

class ActionCard extends StatelessWidget {
  final String name;
  final String duration;
  final IconData icon;
  const ActionCard(
      {required this.name,
      required this.duration,
      required this.icon,
      super.key});
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return SizedBox(
        height: 100,
        child: Card.outlined(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: isLight ? actionOutlineLight : actionOutlineDark,
                )),
            elevation: 1.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        if (isLight) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(200);
                        } else {
                          return Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(60);
                        }
                      }
                      return Theme.of(context)
                          .colorScheme
                          .primary; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {},
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(children: [
                      Container(
                          margin: EdgeInsets.only(right: 12.0),
                          child: Icon(
                            icon,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )),
                      Expanded(
                          child: Text(name,
                              style: Theme.of(context).textTheme.bodyMedium)),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: Text(duration,
                              style: Theme.of(context).textTheme.titleSmall))
                    ])))));
  }
}
