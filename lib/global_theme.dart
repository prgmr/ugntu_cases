import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
    fontFamily: 'Verdana',
    splashColor: Colors.yellow,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ).copyWith(secondary: Colors.green),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
      bodyText2:
          TextStyle(fontSize: 16, fontFamily: 'Roboto', color: Colors.indigo),
    ));
