import 'package:project/features/map/map.dart';
import 'package:project/features/start_page/start_page.dart';

final routes = {
  '/': (context) => const StartPage(),
  '/map_page': (context) => const MapPage()
};
