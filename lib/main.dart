import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/manufacturer.dart';

void main() => runApp(FlutterTutorialApp());

class FlutterTutorialApp extends StatelessWidget {
  FlutterTutorialApp({Key? key}) : super(key: key);
  final List<Manufacturer> manufacturers = [
    Manufacturer(name: "Славица", address: "г.Красноярск, ул.Кутузова, д.45"),
    Manufacturer(name: "Славица", address: "г.Красноярск, ул.Кутузова, д.45"),
    Manufacturer(name: "Славица", address: "г.Красноярск, ул.Кутузова, д.45"),
    Manufacturer(name: "Славица", address: "г.Красноярск, ул.Кутузова, д.45"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(208, 220, 255, 1.0),
        body:
            Container(
                //margin: const EdgeInsets.symmetric(horizontal: 0.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/decor.png"),
                    fit: BoxFit.fill,
                  )
                ),
                child: const Center(
                    child: Text("by",)
                )
            ),
      ),
    );
    //
    // Image.asset("assets/images/1.png"),

    //bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.blue, items: [],),
    // );
  }
}
