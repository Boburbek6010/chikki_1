import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


import '../../../../core/const/api_keys.dart';

final yHomeVM = ChangeNotifierProvider((ref) => YHomeVm());

class YHomeVm extends ChangeNotifier {
  LatLng sourceLocation = const LatLng(41.332508, 69.268681);
  LatLng destinationLocation = const LatLng(41.343534, 69.206220);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;



  void getCurrentLocation() async {
    Location location = Location();
    location.onLocationChanged.listen((event) {
      currentLocation = event;
    });
    notifyListeners();
  }

  YHomeVm(){
    init();
  }

  void init(){
    // getCurrentLocation();
    getPolyPoints();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var pointLatLng in result.points) {
        polylineCoordinates.add(
          LatLng(pointLatLng.latitude, pointLatLng.longitude),
        );
      }
    }
    notifyListeners();
  }
}