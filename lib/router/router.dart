import 'package:project/features/map/map.dart';
// import 'package:project/features/start_page/start_page.dart';
import 'package:project/features/shops/shop.dart';
import 'package:project/features/ice_cream_list/ice_cream.dart';
import 'package:project/features/ice_cream_page/ice_cream_p.dart';

final routes = {
  // '/': (context) => const StartPage(),
  '/map_page': (context) => const MapPage(),
  '/shop_page': (context) => const ShopsPage(),
  '/ice_cream_list': (context) => const IceCreamsPage(),
  '/ice_cream_page': (context) => const IceCreamPage(),
};
