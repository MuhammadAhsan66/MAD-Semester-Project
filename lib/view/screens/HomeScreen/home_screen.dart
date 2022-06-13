import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
import 'package:metro_ticketing/constants.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const LatLng _center = const LatLng(33.64345343654859, 72.99244310053943);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: PrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      // body: FlutterMap(
      //         options: MapOptions(
      //           center: LatLng(51.5, -0.09),
      //           zoom: 13.0,
      //         ),
      //         layers: [
      //           TileLayerOptions(
      //             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      //             subdomains: ['a', 'b', 'c'],
      //             attributionBuilder: (_) {
      //               return Text("© OpenStreetMap contributors");
      //             },
      //           ),
      //           MarkerLayerOptions(
      //             markers: [
      //               Marker(
      //                 width: 80.0,
      //                 height: 80.0,
      //                 point: LatLng(51.5, -0.09),
      //                 builder: (ctx) =>
      //                 Container(
      //                   child: FlutterLogo(),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      );
  }
}
