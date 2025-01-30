import "package:flutter/material.dart";
import "package:flutter/services.dart";

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double _height = 40;
  final double fheight = 60;
  final double initialHeight = 40;
  void onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta == null) return;
    if (details.primaryDelta! < 0) {
      setState(() {
        _height = initialHeight;
        HapticFeedback.lightImpact();
      });
    }
    if (details.primaryDelta! > 0) {
      setState(() {
        _height = fheight;
        HapticFeedback.mediumImpact();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            height: 100,
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragUpdate: onVerticalDrag,
                child: Column(children: [
                  AnimatedContainer(
                      curve: Curves.easeInSine,
                      duration: Duration(milliseconds: 100),
                      width: double.infinity,
                      height: _height,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFF2C2C2C),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16))),
                      child: Text("Info")),
                ]))));
  }
}
