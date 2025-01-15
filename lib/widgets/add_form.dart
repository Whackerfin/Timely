import "package:flutter/material.dart";
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
                        if (name != "" && icon != "" && duration != "") {
                          ActionModel model1 = ActionModel(
                              name: name,
                              icon: Icons.local_pizza,
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
