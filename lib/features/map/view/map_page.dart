import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project/features/map/view/location.dart';
import 'package:project/features/map/view/search_bar.dart';
import 'dart:math' as math;
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final defaultPos = const KrasnoyarskLocation();
  final List<MapObject> _mapObjects = [];
  final MapObject clusterPlacemarks = clusterPlacemark();

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    moveToCurrentLocation(position);
  }

  Future<Position> _determinePosition() async {
    // bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> moveToCurrentLocation(Position position) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: Point(
                latitude: position.latitude, longitude: position.longitude),
            zoom: 18),
      ),
    );
    final currPos = PlacemarkMapObject(
        mapId: const MapObjectId('CurrPoss'),
        opacity: 0.8,
        point:
            Point(latitude: position.latitude, longitude: position.longitude),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
                'assets/images/geolocation.png'),
            scale: 3)));
    changeCurPosition(currPos);
  }

  Future<void> _startPosition(AppLatLong defPosition) async {
    (await mapControllerCompleter.future).moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(
            target:
                Point(latitude: defPosition.lat, longitude: defPosition.long),
            zoom: 12)));
  }

  @override
  void initState() {
    super.initState();
    _startPosition(defaultPos);
    _mapObjects.add(clusterPlacemarks);
  }

  void changeCurPosition(PlacemarkMapObject placemark) {
    setState(() {
      _mapObjects
          .removeWhere((el) => el.mapId == const MapObjectId('CurrPoss'));
      _mapObjects.add(placemark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            YandexMap(
              onMapCreated: (controller) {
                mapControllerCompleter.complete(controller);
              },
              mapObjects: _mapObjects,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 20.0, bottom: 100.0),
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
                                offset: const Offset(
                                    0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child:
                              SearchBar(mapController: mapControllerCompleter),
                          // child: const TextField(
                          //   decoration: InputDecoration(
                          //     icon: Icon(
                          //       Icons.search_rounded,
                          //       size: 30.0,
                          //     ),
                          //     hintText: "Поиск",
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //     ),
                          //   ),
                          // ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
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
                            backgroundColor: Color.fromRGBO(108, 62, 126, 1.0),
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
                          child: IconButton(
                            alignment: Alignment.center,
                            icon: const Icon(
                              Icons.navigation_rounded,
                              size: 30.0,
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                            onPressed: _getCurrentLocation,
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20.0,
                  spreadRadius: 7.0,
                  offset: Offset(0, -5),
                ),
              ]),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                SvgPicture.asset(
                  "assets/images/navbar_without_shadow.svg",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
                  items: [
                    BottomNavigationBarItem(
                      icon: IconButton(
                        icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/shop_page");
                        },
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: IconButton(
                        icon: SvgPicture.asset("assets/images/nav_map.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/map_page");
                        },
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: IconButton(
                        icon:
                            SvgPicture.asset("assets/images/nav_ice_cream.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/ice_cream_list");
                        },
                      ),
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
