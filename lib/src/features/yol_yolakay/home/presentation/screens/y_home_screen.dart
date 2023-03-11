import 'dart:async';
import 'dart:developer';

import 'package:Chikki/src/core/style/images.dart';
import 'package:Chikki/src/core/style/text_style.dart';
import 'package:Chikki/src/features/taxi/settings/make_less.dart';
import 'package:Chikki/src/features/yol_yolakay/home/view_model/y_home_vm.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/const/api_keys.dart';
import '../../../../../core/style/colors.dart';
import '../../../annouce/presentation/screens/annouce_screen.dart';
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
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: ElevatedButton(
            onPressed: (){
              AwesomeDialog(
                  context: context,
                   dialogType: DialogType.noHeader,
                  bodyHeaderDistance: 0,
                  animType: AnimType.rightSlide,
                  body: Column(
                    children: [
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Column(
                         children: [
                           //qayerdan
                           TextField(
                             textAlignVertical: TextAlignVertical.center,
                             decoration: InputDecoration(
                                 prefixIcon: Container(
                                     padding: const EdgeInsets.all(15),
                                     child: AppImages.circleIndicator),
                                 suffixIcon: Container(
                                   padding: const EdgeInsets.all(15),
                                   child: AppImages.searchRout,
                                 ),
                                 hintText: 'Qayerdan',
                                 hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c9DA4B1, fontSize: 16)

                             ),
                           ),
                           //qayerga
                           TextField(
                             textAlignVertical: TextAlignVertical.center,
                             decoration: InputDecoration(
                                 prefixIcon: Container(
                                     padding: const EdgeInsets.all(15),
                                     child: AppImages.ratio
                                 ),
                                 suffixIcon: Container(
                                   padding: const EdgeInsets.all(15),
                                   child: AppImages.searchRout,
                                 ),
                                 hintText: 'Qayerga',
                                 hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c9DA4B1, fontSize: 16)

                             ),
                           ),
                           const SizedBox(height: 15),

                           Row(
                             children: [
                               Expanded(
                                 child:  Row(
                                   children: [
                                     // const SizedBox(width: 10),
                                     AppImages.calendar,
                                     const SizedBox(width: 6),
                                     Text('Bugun', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16))
                                   ],
                                 ),
                               ),
                               Expanded(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Container(
                                       height: 20,
                                       width: 1,
                                       color: AppColors.c9DA4B1,
                                     ),
                                     AppImages.person,
                                     InkWell(
                                       onTap: (){},
                                       child: Container(
                                         alignment: Alignment.center,
                                         width: 25,
                                         height: 25,
                                         decoration: BoxDecoration(
                                           border: Border.all(color: AppColors.c9DA4B1),
                                           borderRadius: BorderRadius.circular(7),
                                         ),
                                         child: const Icon(CupertinoIcons.minus, size: 16, color: AppColors.c9DA4B1,),
                                       ),
                                     ),
                                     Text('1', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
                                     InkWell(
                                       onTap: (){},
                                       child: Container(
                                         alignment: Alignment.center,
                                         width: 25,
                                         height: 25,
                                         decoration: BoxDecoration(
                                           border: Border.all(color: AppColors.black),
                                           borderRadius: BorderRadius.circular(7),
                                         ),
                                         child: const Icon(CupertinoIcons.add, size: 16, color: AppColors.black,),
                                       ),
                                     ),
                                   ],
                                 ),
                               )
                             ],
                           ),

                           const SizedBox(height: 8),

                         ],
                       ),
                     ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AnnouncementScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: AppColors.c2AC1BC,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10), )
                          )
                        ),
                        child: Text('Qidirish', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, color: AppColors.white)),
                      )
                    ],
                  ),
                  padding: EdgeInsets.zero,
              ).show();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(81, 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            child: const Text('E’lon'),
          ),
          actions: [
            IconButton(
              splashRadius: 25,
              onPressed: (){},
              icon: const Icon(CupertinoIcons.bell, color: Colors.red,),
            )
          ],
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
                  myLocationButtonEnabled: false,
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
