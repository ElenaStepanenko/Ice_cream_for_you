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
