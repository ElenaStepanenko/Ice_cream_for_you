import 'package:project/features/map/map.dart';
import 'package:project/features/start_page/start_page.dart';
import 'package:project/features/shops/shop.dart';

final routes = {
  '/': (context) => const StartPage(),
  '/map_page': (context) => const MapPage(),
  // '/shop_page': (context) => const ShopsPage(),
};
