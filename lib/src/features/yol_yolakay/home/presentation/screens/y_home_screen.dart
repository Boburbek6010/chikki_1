import 'package:demo1/src/core/const/api_keys.dart';
import 'package:demo1/src/features/yol_yolakay/home/view_model/y_home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/style/colors.dart';
import '../../../../taxi/settings/make_less.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dialogue.dart';

class YHomeScreen extends ConsumerWidget {
  const YHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(yHomeVM);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(
          onPressed: () => showAlertDialog(context),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(ref.read(yHomeVM).currentLocation!.latitude ?? 41.333201, ref.read(yHomeVM).currentLocation!.longitude ??69.266675),
            zoom: 12,
        ),
        markers: {
          Marker(
              markerId: const MarkerId('source'),
              position: ref.read(yHomeVM).sourceLocation,
          ),
          Marker(
              markerId: const MarkerId('myLocation'),
              position: LatLng(ref.read(yHomeVM).currentLocation!.latitude ?? 41.333201, ref.read(yHomeVM).currentLocation!.longitude ?? 69.266675),
          ),
          Marker(
              markerId: const MarkerId('destination'),
              position: ref.read(yHomeVM).destinationLocation,
          ),
        },
        polylines: {
          Polyline(polylineId: const PolylineId("route"),
            points: ref.read(yHomeVM).polylineCoordinates,
            color: AppColors.c7b61ff,
            width: 4,
          ),
        },
      ),
    );
  }
}
