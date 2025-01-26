import "package:flutter/material.dart";
import "package:timely/colors.dart";

class ActionCard extends StatelessWidget {
  final String name;
  final String duration;
  final IconData icon;
  final String id;
  final int mins;

  const ActionCard({
    required this.name,
    required this.id,
    required this.duration,
    required this.icon,
    required this.mins,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return SizedBox(
      height: 100,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: isLight ? actionOutlineLight : actionOutlineDark,
          ),
        ),
        elevation: 1.0,
        child: GestureDetector(
          onTap: () {
            // Handle tap if needed
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 32.0),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    duration,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
