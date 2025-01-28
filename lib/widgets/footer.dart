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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final time = await _databaseService.getReadyTime();
        if (!_isInitialized) {
          setState(() {
            if (time != null) {
              if (time[2] == "AM") {
                int hour = time[0];
                if (hour == 12) {
                  hour = 0;
                }
                _time = Time(hour: hour, minute: time[1]);
              } else {
                _time = Time(hour: time[0] + 12, minute: time[1]);
              }

              print(time[2]);
            } else {
              _time = Time(hour: 8, minute: 30); // Default time
            }
          });
          setTime();
          _isInitialized = true;
        }
      } catch (e) {
        print("Error initializing ready time: $e");
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
        unselectedColor: Color(0xFFFFF9C4)));
  }

  void setTime() {
    Provider.of<ActionProvider>(context, listen: false)
        .setReadyTime(_time.format(context));
  }

  void onTimeChange(Time time) {
    setState(() {
      int hour = time.hour > 12
          ? time.hour - 12
          : time.hour == 0
              ? 12
              : time.hour;
      String mode = time.hour < 12 ? "AM" : "PM";

      _databaseService.updateReadyTime(hour, time.minute, mode);
      _time = Time(hour: hour, minute: time.minute);
      setTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    timefieldText.text = _time.format(context);

    return Container(
      padding: const EdgeInsets.only(bottom: 8.0, left: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            "READY@",
            style: Theme.of(context).textTheme.bodyMedium,
          )),
          Expanded(
            flex: 2,
            child: TextButton(
                onPressed: _showTimePicker,
                child: Text(
                  _time.format(context),
                  style: Theme.of(context).textTheme.displaySmall,
                )),
          ),
        ],
      ),
    );
  }
}
