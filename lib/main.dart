import 'package:corona_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:ThemeData (
      primaryColor: Color(0xff202c3b),
    ),
    home: HomePage(),
  ));
}
