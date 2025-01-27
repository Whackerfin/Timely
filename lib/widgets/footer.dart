import "package:day_night_time_picker/day_night_time_picker.dart";
import "package:flutter/material.dart";
import "package:timely/providers/actions_provider.dart";
import "package:provider/provider.dart";
import "package:timely/services/database_services.dart";

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final DatabaseService _databaseService = DatabaseService.instance;
  Time _time = Time(hour: 8, minute: 30);
  final timefieldText = TextEditingController();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Schedule the initial time set for after the first build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final time = await _databaseService.getReadyTime();
      if (!_isInitialized) {
        setTime();
        if (time != null) {
          setState(() {
            _time = Time(hour: time[0], minute: time[1]);
          });
        }

        setTime(); // Set the ready time
        _isInitialized = true;
      }
    });
  }

  void _showTimePicker() {
    Navigator.of(context).push(showPicker(
      value: _time,
      blurredBackground: true,
      onChange: onTimeChange,
      context: context,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      is24HrFormat: false,
      accentColor: Theme.of(context).colorScheme.onSecondary,
    ));
  }

  void setTime() {
    Provider.of<ActionProvider>(context, listen: false)
        .setReadyTime(_time.format(context));
  }

  void onTimeChange(Time time) {
    setState(() {
      String mode = time.hour < 12 ? "AM" : "PM";
      _databaseService.updateReadyTime(time.hour, time.minute, mode);
      _time = time;
      // It's safe to call setTime here because we're in a callback
      setTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    timefieldText.text = _time.format(context);
    // Remove the setTime() call from here

    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "READY@",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 32.0),
          TextButton(
            onPressed: _showTimePicker,
            child: Text(
              _time.format(context),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
