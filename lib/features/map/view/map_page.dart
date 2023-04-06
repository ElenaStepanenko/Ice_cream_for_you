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
      //backgroundColor: const Color.fromRGBO(236, 249, 218, 1.0),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const YandexMap(),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 100.0),
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
              Container(
                //alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
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
                            icon: IconButton(icon: SvgPicture.asset("assets/images/nav_menu.svg"), onPressed: (){
                              Navigator.of(context).pushNamed("/shop_page");
                            },),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: IconButton(icon: SvgPicture.asset("assets/images/nav_map.svg"), onPressed: (){},),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: IconButton(icon: SvgPicture.asset("assets/images/nav_ice_cream.svg"), onPressed: (){},),
                            label: '',
                          ),
                        ],
                      ),
                    ]),
              ),
          ]),
        ),
      ),
    );
  }
}
