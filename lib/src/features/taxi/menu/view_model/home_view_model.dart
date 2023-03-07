import 'dart:async';

import 'package:demo1/src/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../data/repository/app_repository_impl.dart';




final homeVM = ChangeNotifierProvider((ref) => HomeVm());

bool isManualMapChosen = false;


class HomeVm extends ChangeNotifier {
  static final Completer<YandexMapController> _completer = Completer();
  late final YandexMapController controller;
  List<MapObject> mapObjects = [];
  late Position myLivePosition;
  late PlacemarkMapObject start;
  late final PlacemarkMapObject stopPlaceMarks;
  late Future<DrivingSessionResult> result;
  bool progress = false;
  late String nameOfCurrentLocation;
  late List<String> list;
  bool isRouteChosen = true;
  double ratingA = 0.0;
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  void ratingAction(double rating){
    ratingA = rating;
    notifyListeners();
  }

  HomeVm() {
    initState();
  }


  /// initializing when app started
  void initState() {
    determinePosition().then((value) {
      final boundingBox = BoundingBox(
        northEast: Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude),
        southWest: Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude),
      );
      controller.moveCamera(CameraUpdate.newTiltAzimuthBounds(boundingBox));
      controller.moveCamera(CameraUpdate.zoomTo(13.5));
      myLocation(Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude));
    });
  }

  /// creating map
  void onMapCreated(YandexMapController controller1) {
    _completer.complete(controller1);
    controller = controller1;
  }

  /// taking string name of lat long
  Future<void> getCurrentLocation() async {
    final response = await AppRepositoryImpl().getCurrentLocation('${myLivePosition.latitude},${myLivePosition.longitude}');
    nameOfCurrentLocation = response;
    list = nameOfCurrentLocation.split(',');
    String item = '';
    var reversed = list.reversed;
    for(int i = 0; i < reversed.toList().length; i++){
     item += '${reversed.toList()[i]},';
    }
    nameOfCurrentLocation = '';
    nameOfCurrentLocation = item.substring(1,item.length);
    notifyListeners();
  }

  /// allow to access location permission and taking current location
  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please Keep your location on.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location Permissio is denied ');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Permission is dined forever');
    }
    myLivePosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    await getCurrentLocation();
    return null;
  }

  /// for finding the current location when icon pressed
  void findLocation() {
    myLocation(Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude));
    var newBoundingBox = BoundingBox(
      northEast: Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude),
      southWest: Point(latitude: myLivePosition.latitude, longitude: myLivePosition.longitude),
    );
    controller.moveCamera(CameraUpdate.newTiltAzimuthBounds(newBoundingBox),);
    controller.moveCamera(
      CameraUpdate.zoomTo(17),
      animation: const MapAnimation(
        type: MapAnimationType.linear,
        duration: 2,
      ),
    );
    notifyListeners();
  }

  /// putting label to my position
  void myLocation(Point point) {
    start = PlacemarkMapObject(
      mapId: const MapObjectId("start_point"),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            scale: 0.7,
            image: BitmapDescriptor.fromAssetImage('assets/images/home/live_location.png')
        ),
      ),
    );
    mapObjects.add(start);
    notifyListeners();
  }

  /// putting label to chosen location
  void tappedLocation(Point point) {
    var stop = PlacemarkMapObject(
      mapId: MapObjectId("stop_point${mapObjects.length + 1}"),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          scale: 0.55,
          image: BitmapDescriptor.fromAssetImage("assets/images/home/home_choose_locator.png"),
        ),
      ),
    );
    mapObjects.removeRange(1, mapObjects.length);
    mapObjects.add(stop);
    progress = true;
    notifyListeners();
  }

  /// drawing a single line
  Future<void> requestRoutes(Point point) async {
    var resultSession = YandexDriving.requestRoutes(
      points: [
        RequestPoint(
          point: start.point,
          requestPointType: RequestPointType.wayPoint,
        ),
        RequestPoint(
          point: point,
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
      drivingOptions: const DrivingOptions(initialAzimuth: 0, routesCount: 2, avoidTolls: true, avoidPoorConditions: true, avoidUnpaved: true),
    );
    result = resultSession.result;
    notifyListeners();
  }

  /// optimising the line
  Future<void> _handleResult(DrivingSessionResult result) async {
    result.routes!.asMap().forEach((i, route) {
      mapObjects.add(PolylineMapObject(
        mapId: MapObjectId('route_${i}_polyline'),
        polyline: Polyline(points: route.geometry),
        strokeColor: AppColors.c2AC1BC,
        strokeWidth: 3,
      ));
    });
    notifyListeners();
  }

  /// for switching previous tapped location
  Future<void> init() async {
    _handleResult(await result).then((value) {
      progress = false;
      notifyListeners();
    });
  }




}




