import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  MapboxMapController mapController;
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WeMapMap(
            reverse: false,
            styleString:
                "https://apis.wemap.asia/vector-tiles/styles/osm-bright/style.json?key=IqzJukzUWpWrcDHJeDpUPLSGndDx",
            onMapCreated: _onMapCreated,
            onMapClick: (poi, latLng) async {
              print(
                  "lat: ${latLng.latitude}, lon: ${latLng.longitude}");
              List features =
                  await mapController.queryRenderedFeatures(poi, [], null);
              if (features.length > 0) {
                print(features[0]);
              }
              mapController.addCircle(
                CircleOptions(
                  geometry: latLng,
                  circleColor: "#FF0000",
                ),
              );
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(21.036634700899015, 105.78185925518193),
              zoom: 16.0,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.directions),
        onPressed: () {},
      ),
    );
  }
}
