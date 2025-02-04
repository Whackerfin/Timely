import "package:animated_reorderable_list/animated_reorderable_list.dart";
import "package:timely/models/actionmodel.dart";
import "package:timely/widgets/actions.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:timely/providers/actions_provider.dart";

class ActionsList extends StatefulWidget {
  const ActionsList({super.key});

  @override
  State<ActionsList> createState() => _ActionsListState();
}

class _ActionsListState extends State<ActionsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ActionProvider>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<ActionProvider>(context, listen: false).initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Error Loading  actions: ${snapshot.error}"));
          }

          return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Expanded(
              child: Ink(
                padding: EdgeInsets.only(top: 67.0, bottom: 10.0),
                child: Consumer<ActionProvider>(
                  builder: (context, actionslist, child) {
                    return actionslist.actions.isNotEmpty
                        ? AnimatedReorderableListView(
                            items: actionslist.actions,
                            itemBuilder: (BuildContext context, int index) {
                              // Render each item as an `ActionCard`
                              final ActionModel model =
                                  actionslist.actions[index];
                              return Dismissible(
                                  key: ValueKey(model.id),
                                  direction: DismissDirection.startToEnd,
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                  ),
                                  onDismissed: (direction) {
                                    setState(() {
                                      Provider.of<ActionProvider>(context,
                                              listen: false)
                                          .removeAt(index);
                                    });
                                  },
                                  child: ActionCard(
                                      name: model.name,
                                      duration: model.duration,
                                      icon: model.icon,
                                      id: model.id,
                                      key: ValueKey(model.id),
                                      mins: model.mins));
                            },
                            enterTransition: [SlideInRight()],
                            exitTransition: [SlideInLeft()],
                            insertDuration: const Duration(milliseconds: 300),
                            removeDuration: const Duration(milliseconds: 300),
                            dragStartDelay: const Duration(milliseconds: 300),
                            onReorder: (int oldIndex, int newIndex) async {
                              if (oldIndex != newIndex) {
                                // Update the list order in the provider
                                final movedItem = actionslist.actions[oldIndex];
                                actionslist.actions.removeAt(oldIndex);
                                actionslist.actions.insert(newIndex, movedItem);
                                await actionslist.updateOrderInDatabase();
                              }
                            },
                            isSameItem: (a, b) => a.id == b.id,
                          )
                        : Center(
                            child: Text("Add some actions!!!"),
                          );
                  },
                ),
              ),
            ),
          );
        });
  }
}
