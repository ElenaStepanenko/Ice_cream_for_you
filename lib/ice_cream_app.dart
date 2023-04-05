import 'package:flutter/material.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class IceCreamApp extends StatelessWidget {
  const IceCreamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IceCreamForYou',
      theme: theme,
      routes: routes,
    );
  }
}
