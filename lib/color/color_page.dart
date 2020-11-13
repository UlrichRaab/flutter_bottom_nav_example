import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  ColorPage({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          color.toString(),
        ),
      ),
    );
  }
}
