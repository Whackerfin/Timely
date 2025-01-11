import "package:flutter/material.dart";

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("READY@", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(width: 32.0),
            Text("8:00 AM", style: Theme.of(context).textTheme.displaySmall)
          ],
        ));
  }
}
