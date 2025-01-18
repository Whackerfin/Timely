import "package:day_night_time_picker/day_night_time_picker.dart";
import "package:flutter/material.dart";
import "package:timely/providers/actions_provider.dart";
import "package:provider/provider.dart";

class Footer extends StatefulWidget {
  const Footer({super.key});
  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  Time _time = Time(hour: 8, minute: 30);
  final timefieldText = TextEditingController();
  void _showTimePicker() {
    Navigator.of(context).push(showPicker(
        value: _time,
        blurredBackground: true,
        onChange: onTimeChange,
        context: context,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        is24HrFormat: false,
        accentColor: Theme.of(context).colorScheme.onSecondary));
  }

  void setTime() {
    Provider.of<ActionProvider>(context, listen: false)
        .setReadyTime(_time.format(context));
  }

  void onTimeChange(Time time) {
    setState(() {
      _time = time;
      setTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    timefieldText.text = _time.format(context);
    setTime();
    return Container(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("READY@", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 32.0),
            TextButton(
                onPressed: () {
                  _showTimePicker();
                },
                child: Text(_time.format(context),
                    style: Theme.of(context).textTheme.displaySmall))
          ],
        ));
  }
}
