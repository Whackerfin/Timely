import "dart:ui";
import 'package:uuid/uuid.dart';
import "package:timely/colors.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:uuid/v4.dart";
import 'package:wheel_picker/wheel_picker.dart';
import "package:timely/models/actionmodel.dart";
import "package:timely/providers/actions_provider.dart";

class ActionForm extends StatefulWidget {
  const ActionForm({super.key, required this.collapse, required this.shake});
  final VoidCallback collapse;
  final VoidCallback shake;
  @override
  State<ActionForm> createState() => _ActionFormState();
}

class _ActionFormState extends State<ActionForm> {
  final namefieldText = TextEditingController();
  final timefieldText = TextEditingController();
  final iconfieldText = TextEditingController();
  final namefocusnode = FocusNode();
  final iconfocusnode = FocusNode();
  String name = "";
  String duration = "";
  String icon = "";
  int _hours = 0;
  int _mins = 5;
  late final _hoursWheel = WheelPickerController(
    itemCount: 13,
    initialIndex: _hours % 12,
  );
  late final _minsWheel = WheelPickerController(
      itemCount: 60, initialIndex: _mins, mounts: [_hoursWheel]);

  int findTotalTime() {
    final hrs = _hours * 60;
    return hrs + _mins;
  }

  void setTime(hours, mins) {
    String time = "";
    if (hours != 0) {
      time = "$hours" "hrs ";
    }
    if (mins != 0) {
      time += "$mins" "min";
    }
    if (hours == 0 && mins == 0) {
      time = "";
    }
    setState(() {
      duration = time;
      timefieldText.text = time;
    });
  }

  void acceptTime() {
    setState(() {
      _hours = _hoursWheel.selected;
      _mins = _minsWheel.selected;
      Navigator.of(context).pop();
      setTime(_hours, _mins);
    });
  }

  void showOverlay(BuildContext context, timeWheels) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(127), // Semi-transparent background
      barrierDismissible: true, // Dismiss on tapping outside
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
          child: Center(
            child: Container(
              width: 400.0,
              height: 500.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: Text(
                      "Pick how long it will take you to complete your action",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                      right: 90,
                      top: 0,
                      bottom: 0,
                      child: Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: centerBar(context))),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 100.0, right: 100.0, top: 40.0),
                      child: Container(
                        width: 200.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...timeWheels,
                            const SizedBox(width: 6.0),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
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
                                      if (states
                                          .contains(WidgetState.pressed)) {
                                        return Theme.of(context)
                                            .colorScheme
                                            .error
                                            .withAlpha(180);
                                      }
                                      return Theme.of(context)
                                          .colorScheme
                                          .error;
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                            SizedBox(width: 30.0),
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
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
                                      if (states
                                          .contains(WidgetState.pressed)) {
                                        return Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withAlpha(180);
                                      }
                                      return Theme.of(context)
                                          .colorScheme
                                          .secondary;
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  acceptTime();
                                },
                                child: Text("Ok",
                                    style:
                                        Theme.of(context).textTheme.bodySmall))
                          ]))
                ],
              ),
            ),
          ),
        );
      },
    );
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
    if (name == "" || duration == "") {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    // Don't forget to dispose the controllers at the end.
    namefieldText.dispose();
    iconfieldText.dispose();
    timefieldText.dispose();
    namefocusnode.dispose();
    iconfocusnode.dispose();
    _hoursWheel.dispose();
    _minsWheel.dispose();
    super.dispose();
  }

  Widget centerBar(BuildContext context) {
    return Center(
      child: Container(
        width: 220.0,
        height: 38.0,
        decoration: BoxDecoration(
          color: const Color(0xFFC3C9FA).withAlpha(26),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 32.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );
    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setTime(_hours, _mins);
    });
    final timeWheels = <Widget>[
      Expanded(
        child: WheelPicker(
          builder: itemBuilder,
          controller: _hoursWheel,
          looping: false,
          style: wheelStyle,
          selectedIndexColor: Colors.redAccent,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text("hrs", style: textStyle),
      ),
      Expanded(
        child: WheelPicker(
          builder: itemBuilder,
          controller: _minsWheel,
          looping: true,
          style: wheelStyle,
          selectedIndexColor: Colors.redAccent,
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Text("min", style: textStyle),
      ),
    ];

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
                            child: TextFormField(
                          focusNode: namefocusnode,
                          onTap: () {
                            FocusScope.of(context).requestFocus(namefocusnode);
                            iconfocusnode.unfocus();
                          },
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
                            child: TextFormField(
                          focusNode: iconfocusnode,
                          onTap: () {
                            FocusScope.of(context).requestFocus(iconfocusnode);
                            namefocusnode.unfocus();
                          },
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
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Text("Duration",
                              style: Theme.of(context).textTheme.titleLarge),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? underlineColorLight
                                                    : underlineColorDark))),
                                child: GestureDetector(
                                  onTap: () {
                                    showOverlay(context, timeWheels);
                                  },
                                  child: Text(
                                    timefieldText.text.isEmpty
                                        ? "Select Duration"
                                        : timefieldText.text,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                )),
                          ),
                        ],
                      )
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
                          int unicode = icon.isNotEmpty
                              ? icon.runes.first
                              : Icons.timer.codePoint;
                          ActionModel model1 = ActionModel(
                              name: name,
                              icon: isIconUnicode(icon)
                                  ? IconData(unicode,
                                      fontFamily: 'MaterialIcons')
                                  : IconData(Icons.timer.codePoint,
                                      fontFamily: 'MaterialIcons'),
                              duration: duration,
                              id: Uuid().v4(),
                              mins: (60 * _hours + _mins));
                          Provider.of<ActionProvider>(context, listen: false)
                              .add(model1);
                          Provider.of<ActionProvider>(context, listen: false)
                              .increaseTime(findTotalTime());
                          widget.collapse();
                          clearText();
                        } else {
                          widget.shake();
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
