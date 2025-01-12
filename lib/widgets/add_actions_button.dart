import "package:flutter/material.dart";
import "package:timely/widgets/add_form.dart";

class AddActionsButton extends StatefulWidget {
  const AddActionsButton({super.key});
  @override
  State<AddActionsButton> createState() => _AddActionsState();
}

class _AddActionsState extends State<AddActionsButton> {
  bool _isPressed = false;
  void press() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(top: 20.0, bottom: 25.0),
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SizeTransition(
                sizeFactor: animation, // Animates the size factor
                axis: Axis.vertical, // Expand vertically
                child: child,
              );
            },
            child: !_isPressed
                ? Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          constraints: BoxConstraints(minHeight: 65.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0))),
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
                              onPressed: () {
                                press();
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ADD AN ACTION ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Icon(Icons.keyboard_arrow_up,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                        size: 32.0),
                                  ]))),
                    )
                  ])
                : ActionsForm(onPressed: press)));
  }
}
