import 'dart:async';
import 'dart:developer';

import 'package:Chikki/src/features/taxi/settings/make_less.dart';
import 'package:Chikki/src/features/yol_yolakay/home/view_model/y_home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/const/api_keys.dart';
import '../../../../../core/style/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dialogue.dart';

class YHomeScreen extends ConsumerWidget {
  const YHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(yHomeVM);
    return StatefulWrapper(
      onInit: () {
        ref.read(yHomeVM).stream.forEach((value) => ref.read(yHomeVM).newLocationUpdate(value, context));
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          title: CustomAppBar(
            onPressed: () => showAlertDialog(context),
            backButton: (){
              ref.read(yHomeVM).controller.future.whenComplete(() {
                log('aaaa');
                log('aaaa');
                log('aaaa');
                log('aaaa');
                log('aaaa');
                ref.read(yHomeVM).end();
                Navigator.of(context).pop();
              });
            },
          ),
        ),
        body: ref.read(yHomeVM).currentLocation == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Animarker(
                rippleRadius: 1,
                rippleColor: Colors.teal,
                rippleDuration: const Duration(seconds: 10),
                duration: const Duration(seconds: 5),
                shouldAnimateCamera: false,
                markers: ref.read(yHomeVM).markers.values.toSet(),
                mapId: ref.read(yHomeVM).controller.future.then<int>((value) => value.mapId),
                child: GoogleMap(
                  onMapCreated: (gController) => ref.read(yHomeVM).controller.complete(gController),
                  // mapType: MapType.terrain,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(ref.read(yHomeVM).currentLocation!.latitude, ref.read(yHomeVM).currentLocation!.longitude),
                    zoom: 12,
                  ),
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      points: ref.read(yHomeVM).polylineCoordinates,
                      color: AppColors.c7b61ff,
                      width: 4,
                    ),
                  },
                ),
              ),
      ),
    );
  }
}
