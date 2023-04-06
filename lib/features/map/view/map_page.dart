import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //persistentFooterAlignment: Per,
      backgroundColor: const Color.fromRGBO(252, 252, 247, 1.0),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              //const YandexMap(),
              Image.asset("assets/images/map.png",
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              width: 270,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 30,
                                    offset: const Offset(
                                        0, 10), // changes position of shadow
                                  ),
                                ],
                              ),

                              child: const TextField(
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.search_rounded,
                                    size: 30.0,
                                  ),
                                  hintText: "Поиск",
                                  //fillColor: Colors.white,
                                  //filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 16,
                                    offset: const Offset(
                                        0, 10), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30.0,
                                backgroundColor:
                                    Color.fromRGBO(108, 62, 126, 1.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 30.0,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            )
                          ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 16,
                                offset: const Offset(
                                    0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor:
                                const Color.fromRGBO(108, 62, 126, 1.0),
                            child: Transform.rotate(
                              angle: 45 * math.pi / 180,
                              child: const IconButton(
                                alignment: Alignment.center,
                                icon: Icon(
                                  Icons.navigation_rounded,
                                  size: 30.0,
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ],
                  ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar:
      Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0,
            spreadRadius: 7.0,
            offset: Offset(0, -5),
          ),
        ]),
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
          SvgPicture.asset(
            "assets/images/navbar_without_shadow.svg",
            //color: Colors.cyan,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            //height: MediaQuery.of(context).size.height,
            //fit: BoxFit.fill,
          ),
          BottomNavigationBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/nav_ice_cream.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                label: '',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
