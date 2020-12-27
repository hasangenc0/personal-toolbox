import 'package:flutter/material.dart';
import 'package:personal_toolbox/screens/home.dart';

void main() {
  runApp(MaterialApp(
      title: 'Personal Toolbox App',
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      }));
}
