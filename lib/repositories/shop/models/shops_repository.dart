import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class Shop {
  Point point;
  String address;
  String name;
  Image photo;
  Shop(
      {required this.point,
      required this.address,
      required this.name,
      required this.photo});
}

final List<Shop> shops = [
  Shop(
      point: const Point(latitude: 55.996703, longitude: 92.790779),
      address: 'ул. Академика Киренского, 13',
      name: 'Сладко',
      photo: Image.asset(
        "assets/images/shop_image.png",
        width: 50,
      )),
  Shop(
      point: const Point(latitude: 56.006397, longitude: 92.831557),
      address: 'ул. Бограда, 144',
      name: 'Славица',
      photo: Image.asset(
        "assets/images/shop_image.png",
        width: 50,
      )),
  Shop(
      point: const Point(latitude: 55.996703, longitude: 92.947460),
      address: 'ул. Щорса, 62',
      name: 'Инмарко',
      photo: Image.asset(
        "assets/images/shop_image_inmarco.png",
        width: 50,
      )),
  Shop(
      point: const Point(latitude: 56.013069, longitude: 92.885741),
      address: 'просп. Мира, 26',
      name: 'Мороженое',
      photo: Image.asset(
        "assets/images/shop_image.png",
        width: 50,
      )),
  Shop(
      point: const Point(latitude: 56.052183, longitude: 92.973749),
      address: 'ул. Тельмана, 9/2,',
      name: 'Славица',
      photo: Image.asset(
        "assets/images/shop_image.png",
        width: 50,
      )),
  Shop(
      point: const Point(latitude: 56.064397, longitude: 92.916834),
      address: 'Светлогорская ул., 19Г/1',
      name: 'Инмарко',
      photo: Image.asset(
        "assets/images/shop_image_inmarco.png",
        width: 50,
      ))
];
