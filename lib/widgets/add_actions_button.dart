import "package:flutter/material.dart";
import "package:timely/widgets/add_form.dart";

class AddActionsButton extends StatefulWidget {
  const AddActionsButton({super.key});
  @override
  State<AddActionsButton> createState() => _AddActionsState();
}

class _AddActionsState extends State<AddActionsButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void press() {
    setState(() {
      _isPressed = !_isPressed;
      _isPressed ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
              height: 65.0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomLeft:
                            _isPressed ? Radius.zero : Radius.circular(12.0),
                        bottomRight:
                            _isPressed ? Radius.zero : Radius.circular(12.0),
                      ),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Theme.of(context)
                            .colorScheme
                            .secondary
                            .withAlpha(180);
                      }
                      return Theme.of(context).colorScheme.secondary;
                    },
                  ),
                ),
                onPressed: press,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ADD AN ACTION ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    AnimatedRotation(
                      turns: _isPressed ? 0.5 : 0.0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 32.0,
                      ),
                    ),
                  ],
                ),
              )),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _controller.value,
                  child: ActionsForm()
                ),
              );
            },
          ),
        ]));
  }
}
