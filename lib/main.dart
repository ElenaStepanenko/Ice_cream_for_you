import 'package:flutter/material.dart';
import 'package:project/router/router.dart';
import 'package:project/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IceCreamForYou',
      theme: theme,
      routes: routes,
    );
  }
}
