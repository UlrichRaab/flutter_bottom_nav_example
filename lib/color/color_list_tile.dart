import 'package:animations/animations.dart';
import 'package:bottom_nav_example/color/color_page.dart';
import 'package:flutter/material.dart';

class ColorListTile extends StatelessWidget {
  ColorListTile({
    Key key,
    this.name,
    this.color,
  }) : super();

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      tappable: false,
      closedColor: color,
      closedShape: ContinuousRectangleBorder(),
      closedElevation: 0,
      closedBuilder: (context, action) {
        return ListTile(
          title: Text(name),
          onTap: action,
        );
      },
      openBuilder: (context, action) {
        return ColorPage(
          title: name,
          color: color,
        );
      },
    );
  }
}
