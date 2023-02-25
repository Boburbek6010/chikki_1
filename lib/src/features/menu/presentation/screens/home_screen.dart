import 'package:demo1/src/core/style/colors.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/menu/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../widgets/home_bottom_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeVM);
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            nightModeEnabled: true,
            modelsEnabled: true,
            onMapCreated: (YandexMapController controller){
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
              ?const Center(
            child: CircularProgressIndicator(),
          )
              :const SizedBox.shrink(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 48, left: 24),
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade700,
                        offset: const Offset(0, 1), //(x,y)
                        blurRadius: 40,
                        spreadRadius: 1
                    ),
                  ],
                ),
                child: MaterialButton(
                  shape: const CircleBorder(),
                  splashColor: AppColors.c2AC1BC,
                  onPressed: (){},
                  child: AppImages.homeLeadingButton,
                ),
              ),
              const HomeModelBottomSheet(),
            ],
          ),
          Align(
            alignment: const Alignment(0.5, 0.1),
            child: AppImages.homeCar1,
          ),
          Align(
            alignment: const Alignment(0, -0.6),
            child: AppImages.homeCar2,
          ),
          Align(
            alignment: const Alignment(-0.7, 0),
            child: AppImages.homeCar3,
          ),
        ],
      ),
    );
  }
}
