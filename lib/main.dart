import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepOrangeAccent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white),
      ),
    ),
    initialRoute: '/',
    routes: {'/': (context) => MainScreen(), '/todo': (context) => Home()},
    debugShowCheckedModeBanner: false,
  ),
);
