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
    final theme = Theme.of(context);
    final luminance = color.computeLuminance();
    return OpenContainer(
      tappable: false,
      closedColor: color,
      closedShape: ContinuousRectangleBorder(),
      closedElevation: 0,
      closedBuilder: (context, action) {
        return ListTile(
          isThreeLine: true,
          title: Text(
            name,
            style: theme.textTheme.headline6.copyWith(
              color: luminance < 0.5 ? Colors.white : Colors.black,
            ),
          ),
          subtitle: Text(
            color.toString(),
            style: theme.textTheme.bodyText2.copyWith(
              color: luminance < 0.5 ? Colors.white60 : Colors.black54,
            ),
          ),
          onTap: action,
        );
      },
      openColor: color,
      openBuilder: (context, action) {
        return ColorPage(
          title: name,
          color: color,
        );
      },
    );
  }
}
