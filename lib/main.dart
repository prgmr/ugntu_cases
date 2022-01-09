import 'package:flutter/material.dart';

import 'screens/app_bar.dart';
import 'screens/auth_screen.dart';
import 'screens/navigation_drawer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AuthScreen(),
      ),
    );
  }
}
