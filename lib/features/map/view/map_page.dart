import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                width: 270,
                //color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),

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
              const CircleAvatar(
                radius: 30.0,
                backgroundColor: Color.fromRGBO(108, 62, 126, 1.0),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 30.0,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                  onPressed: null,
                ),
              )
            ])
          ],
        ),
      )),
=======
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                offset: const Offset(0, 10), // changes position of shadow
                              ),
                            ],
                        ),

                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search_rounded, size: 30.0,),
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
                              offset: const Offset(0, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Color.fromRGBO(108, 62, 126, 1.0),
                          child: IconButton(
                            icon: Icon(Icons.favorite, size: 30.0, color: Color.fromRGBO(255, 255, 255, 1.0),),
                            onPressed: null,
                          ),
                        ),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 16,
                                offset: const Offset(0, 10), // changes position of shadow
                              ),
                            ],
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: const Color.fromRGBO(108, 62, 126, 1.0),
                          child: Transform.rotate(
                            angle: 45 * math.pi / 180,
                            child: const IconButton(
                              alignment: Alignment.center,
                            icon: Icon(Icons.navigation_rounded, size: 30.0, color: Color.fromRGBO(255, 255, 255, 1.0),),
                            onPressed: null,
                          ),
                        ),
                    ),)
                ]),
                Stack(

                  children: [
                    BottomNavigationBar(

                          backgroundColor: Colors.white,

                          items: [
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                            label: '',
                          ),],),

                  ]),
              ],
            ),
          )
      ),
>>>>>>> 41c9f50f1f9138149f47f305b5ce5914347fa246
    );
  }
}
