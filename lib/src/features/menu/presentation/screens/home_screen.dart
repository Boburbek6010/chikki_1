import 'package:demo1/src/features/menu/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../../core/global_keys.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';
import '../widgets/arrive_passanger.dart';
import '../widgets/dvider.dart';
import '../widgets/find_car_rotcess.dart';
import '../widgets/home_bottom_model.dart';
import '../widgets/home_cars_position.dart';
import '../widgets/home_drawer_builder.dart';

import '../widgets/home_choose_car/home_all_choose_car.dart';
import '../widgets/home_choose_route/home_choose_route.dart';
import '../widgets/home_main/home_main_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeVM);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        key: ref.read(homeVM).scaffoldKey,
      drawer: const Drawer(
        child: DividerW(),
      ),
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

          /// home
          // HomeMainBottomSheet(onTap: () {
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchRoutScreen(myLocate: ref.read(homeVM).nameOfCurrentLocation,)));
          // },),

          /// route
          // HomeChooseRouteSheet(onMainButtonPressed: () {  }),

          /// choose car
          const HomeChooseCar(),

        ],
      )
    );
  }
}



