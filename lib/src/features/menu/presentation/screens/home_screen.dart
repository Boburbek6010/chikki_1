import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/menu/view_model/home_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:lottie/lottie.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../core/style/colors.dart';
import '../widgets/came_car_one.dart';
import '../widgets/find_car_rotcess.dart';
import '../widgets/home_bottom_model.dart';
import '../widgets/home_cars_position.dart';
import '../widgets/home_drawer_builder.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeVM);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          YandexMap(
            nightModeEnabled: false,
            modelsEnabled: true,
            onMapCreated: (YandexMapController controller) {
              ref.read(homeVM).onMapCreated(controller);
            },
            mapObjects: ref.read(homeVM).mapObjects,
            onMapTap: (value) {
              ref.read(homeVM).tappedLocation(value);
              ref.read(homeVM).requestRoutes(value);
              ref.read(homeVM).init();
            },
          ),
          ref.read(homeVM).progress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  const [
              HomeDrawerBuilder(),
              HomeModelBottomSheet(),

            ],
          ),
           const HomeCarsPositions(),


        ],
      ),
    );
  }
}




