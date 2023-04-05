import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                            borderRadius: BorderRadius.circular(30.0)
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
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Color.fromRGBO(108, 62, 126, 1.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite, size: 30.0, color: Color.fromRGBO(255, 255, 255, 1.0),),
                          onPressed: null,
                        ),
                      )
                    ])
              ],
            ),
          )
      ),,
    );
  }
}
