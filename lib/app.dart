import 'package:bottom_nav_example/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Colors',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.grey.shade100,
        ),
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
