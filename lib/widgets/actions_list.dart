import "package:timely/models/actionmodel.dart";
import "package:timely/widgets/actions.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:timely/providers/actions_provider.dart";

class ActionsList extends StatelessWidget {
  const ActionsList({super.key});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Expanded(
            child: Ink(
                padding: EdgeInsets.only(top: 67.0, bottom: 10.0),
                child: Consumer<ActionProvider>(
                    builder: (context, actionslist, child) {
                  return ListView.builder(
                      itemCount: actionslist.actions.length,
                      itemBuilder: (BuildContext context, int index) {
                        ActionModel model1 = ActionModel(
                            name: actionslist.actions[index].name,
                            icon: actionslist.actions[index].icon,
                            duration: actionslist.actions[index].duration);
                        return ActionCard(
                            name: model1.name,
                            duration: model1.duration,
                            icon: model1.icon);
                      });
                }))));
  }
}
