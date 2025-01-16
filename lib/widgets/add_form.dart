import "package:flutter/material.dart";
import 'package:day_night_time_picker/day_night_time_picker.dart';
import "package:provider/provider.dart";
import "package:timely/models/actionmodel.dart";
import "package:timely/providers/actions_provider.dart";

class ActionForm extends StatefulWidget {
  const ActionForm({super.key, required this.collapse});
  final VoidCallback collapse;
  @override
  State<ActionForm> createState() => _ActionFormState();
}

class _ActionFormState extends State<ActionForm> {
  final namefieldText = TextEditingController();
  final timefieldText = TextEditingController();
  final iconfieldText = TextEditingController();
  String name = "";
  String duration = "";
  String icon = "";
  Time _time = Time(hour: 0, minute: 30);
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

  void onTimeChange(Time time) {
    setState(() {
      _time = time;
      timefieldText.text = _time.format(context);
    });
  }

  void clearText() {
    namefieldText.clear();
    iconfieldText.clear();
    timefieldText.clear();
    setState(() {
      name = "";
      duration = "";
      icon = "";
    });
  }

  bool isIconUnicode(String input) {
    if (input.isEmpty) {
      return false;
    }
    var codePoints = input.runes;
    for (var codePoint in codePoints) {
      if (codePoint >= 0x1F600 && codePoint <= 0x1F64F) {
        // Unicode range for emoticons
        return true;
      } else if (codePoint >= 0x1F300 && codePoint <= 0x1F5FF) {
        // Unicode range for Miscellaneous Symbols and Pictographs
        return true;
      } else if (codePoint >= 0x1F680 && codePoint <= 0x1F6FF) {
        // Unicode range for Transport and Map Symbols
        return true;
      } else if (codePoint >= 0x1F700 && codePoint <= 0x1F77F) {
        // Unicode range for Alchemical Symbols return true;
      } else if (codePoint >= 0x1F780 && codePoint <= 0x1F7FF) {
        // Unicode range for Geometric Shapes Extended
        return true;
      }
    }

    return false;
  }

  bool verify() {
    if (!isIconUnicode(icon)) {
      return false;
    }
    if (name == "") {
      return false;
    }
    return true;
  }

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
        child: Stack(children: [
          Column(children: [
            Container(
                padding: EdgeInsets.only(left: 26.0, right: 80.0),
                child: Row(children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text("Title",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: TextField(
                          controller: namefieldText,
                          onChanged: (text) {
                            setState(() {
                              name = text;
                            });
                          },
                          decoration: InputDecoration(
                            maintainHintHeight: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ]),
                      SizedBox(height: 10.0),
                      Row(children: [
                        Text("Icon",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: TextField(
                          controller: iconfieldText,
                          onChanged: (text) {
                            setState(() {
                              icon = text;
                            });
                          },
                          decoration: InputDecoration(
                            maintainHintHeight: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ]),
                      SizedBox(height: 10.0),
                      Row(children: [
                        Text("Duration",
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(width: 10.0),
                        Expanded(
                            child: TextField(
                          onTap: _showTimePicker,
                          controller: timefieldText,
                          onChanged: (text) {
                            setState(() {
                              duration = text;
                            });
                          },
                          decoration: InputDecoration(
                            maintainHintHeight: true,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ]),
                    ],
                  )),
                ]))
          ]),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  constraints: BoxConstraints(minWidth: 40.0),
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.only(left: 20.0, bottom: 0.0),
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                        ),
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
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
                      onPressed: () {
                        if (verify()) {
                          int unicode = icon.runes.first;
                          ActionModel model1 = ActionModel(
                              name: name,
                              icon: IconData(unicode,
                                  fontFamily: "MaterialIcons"),
                              duration: duration);
                          Provider.of<ActionProvider>(context, listen: false)
                              .add(model1);
                          widget.collapse();
                          clearText();
                        }
                      },
                      icon: Icon(
                        size: 32,
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ))))
        ]));
  }
}
