import 'package:flutter_map/flutter_map.dart';

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'http://img.bsod.fans:44219/tiles/{z}/{x}/{y}.png',
      userAgentPackageName: 'norld_map',
      minZoom: 4,
      maxZoom: 8,
    );
