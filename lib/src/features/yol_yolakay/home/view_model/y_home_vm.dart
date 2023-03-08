
import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' hide LocationAccuracy;


import '../../../../core/const/api_keys.dart';
import '../presentation/widgets/custom_dialogue.dart';

final yHomeVM = ChangeNotifierProvider((ref) => YHomeVm());
class YHomeVm extends ChangeNotifier {
  final kSantoDomingo = const CameraPosition(target: farhodBozori, zoom: 15);
  MarkerId kMarkerId = const MarkerId('MapkitUI1');
  Position? currentLocation;
  LocationData? currentLocation1;
  late bool serviceEnabled;
  late LocationPermission permission;
  final controller = Completer<GoogleMapController>();
  final markers = <MarkerId, Marker>{};
  final stream = Stream.periodic(const Duration(seconds: 3), (count) => fFarhodToCity[count]).take(fFarhodToCity.length);
  LatLng sourceLocation = const LatLng(41.332508, 69.268681);
  LatLng destinationLocation = const LatLng(41.343534, 69.206220);
  List<LatLng> polylineCoordinates = [];

  YHomeVm(){
    init();
  }

  void init(){
    getCurrentLocation().then((value) {
      getPolyPoints();
    });
  }

  Future<dynamic> getCurrentLocation() async {
    log('message');

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied forever, we can\'t request anymore');
    }

    currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    notifyListeners();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(fFarhodToCity.first.latitude, fFarhodToCity.first.longitude),
      PointLatLng(fFarhodToCity.last.latitude, fFarhodToCity.last.longitude),
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

  Future<void> newLocationUpdate(LatLng latLng, BuildContext context) async {
    var marker = RippleMarker(
      onTap: () => showAlertDialog(context),
      markerId: kMarkerId,
      position: latLng,
        icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
            'assets/images/home/img_1.png', 130),
        ),
      infoWindow: const InfoWindow(
        title: "Farhod bozori -> Hadra maydoni",
        snippet: '2 ta o\'rin bo\'sh ',
      ),
      ripple: true,
    );
    markers[kMarkerId] = marker;
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

}