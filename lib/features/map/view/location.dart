import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../repositories/shop/models/shops_repository.dart';

class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class KrasnoyarskLocation extends AppLatLong {
  const KrasnoyarskLocation({
    super.lat = 56.01839,
    super.long = 92.86717,
  });
}

MapObject clusterPlacemark() {
  final List<PlacemarkMapObject> placemarks = [];
  for (int i = 0; i < shops.length; i++) {
    final placemark = PlacemarkMapObject(
        mapId: MapObjectId(('ShopPlacemark$i')),
        opacity: 0.8,
        point: shops[i].point,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
                'assets/images/shop_item_location.png'),
            scale: 2.3)));
    placemarks.add(placemark);
  }
  final mapObject = ClusterizedPlacemarkCollection(
    mapId: const MapObjectId('LargePlacemark'),
    radius: 30,
    minZoom: 15,
    onClusterAdded:
        (ClusterizedPlacemarkCollection self, Cluster cluster) async {
      return cluster.copyWith(
          appearance: cluster.appearance.copyWith(
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage(
                      'assets/images/shop_item_location.png'),
                  scale: 4))));
    },
    placemarks: placemarks,
  );
  return mapObject;
}
