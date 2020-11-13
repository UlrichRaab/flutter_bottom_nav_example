import 'package:bottom_nav_example/color/color_list_Tile.dart';
import 'package:flutter/material.dart';

class ColorSwatchPage extends StatelessWidget {
  ColorSwatchPage({
    Key key,
    this.name,
    this.colorSwatch,
    this.shades,
  }) : super();

  final String name;
  final ColorSwatch<int> colorSwatch;
  final List<int> shades;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      itemCount: shades.length,
      itemBuilder: (context, index) {
        int shade = shades[index];
        return ColorListTile(
          name: '$shade',
          color: colorSwatch[shade],
        );
      },
    );
  }
}
