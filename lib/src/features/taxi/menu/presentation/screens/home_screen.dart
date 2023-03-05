import 'package:demo1/src/features/taxi/menu/view_model/home_view_model.dart';
import 'package:demo1/src/features/taxi/settings/checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../order/presentation/screens/search_rout_screen.dart';
import '../widgets/arrive_passanger/arrive_passanger.dart';
import '../widgets/came_car_prtotess/came_car_one.dart';
import '../widgets/dvider.dart';
import '../widgets/find_car_rotcess.dart';
import '../widgets/home_choose_car/home_all_choose_car.dart';
import '../widgets/home_choose_route/home_choose_route.dart';
import '../widgets/home_main/home_main_bottom_sheet.dart';

class HomeScreen extends ConsumerWidget {
  String? nameOfChosenRoute;

  HomeScreen({this.nameOfChosenRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeVM);
    ref.watch(checker);
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

          ref.read(checker).names == 'first_home'
              ? ref.read(checker).fromSearchToHome
                  ? HomeChooseRouteSheet(
                      onMainButtonPressed: () {
                        ref.read(checker).changeName('second_home');
                      },
                      onBackButtonPressed: () {
                        l.i('message1');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SearchRoutScreen()));
                      },
                      mainNameOfRoute: nameOfChosenRoute ?? 'Sergili 3',
                      onLocatorPressed: () {
                        ref.read(homeVM).findLocation();
                        l.w("locator");
                      },
                    )
                  : HomeMainBottomSheet(
                      onDrawerBuilderPressed: () {
                        ref.read(homeVM).scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () async {
                        nameOfChosenRoute =
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchRoutScreen(
                                      myLocate: ref
                                          .read(homeVM)
                                          .nameOfCurrentLocation,
                                    )));
                      },
                    )
              : ref.read(checker).names == 'second_home'
                  ? ref.read(checker).fromRouteToCar
                      ? const SizedBox()
                      : HomeChooseCar(
                          onMainPressed: () {
                            findCarDialog(
                                onTimeEnd: () {
                                  Navigator.of(context).pop();
                                  ref.read(checker).changeName('third_home');
                                },
                                context: context,
                                onCancel: () {
                                  Navigator.pop(context);
                                  ref.read(checker).fFromRouteToCarFalse();
                                });
                            ref.read(checker).fFromRouteToCar();
                          },
                          onBackPressed: () {
                            ref.read(checker).changeName('first_home');
                            // Navigator.pop(context);
                          },
                        )
                  : ref.read(checker).names == 'third_home'
                      ? ref.read(checker).fromCameCarToArrive
                          ? ArrivePassenger(
                              ratingAction: () {
                                ref
                                    .read(homeVM)
                                    .ratingAction(ref.read(homeVM).ratingA);
                                Future.delayed(const Duration(seconds: 2))
                                    .then((value) {
                                  ref.read(checker).changeName('first_home');
                                  ref
                                      .read(checker)
                                      .sBackFromSearchToHomeFalse();
                                });
                              },
                            )
                          : CameCarProcess(
                              onEndTime: () {
                                ref.read(checker).fFromCameCarToArrive();
                                ref.read(checker).changeName('third_home');
                              },
                              cancel: () {
                                ref.read(checker).fFromRouteToCarFalse();
                                ref.read(checker).changeName('second_home');
                              },
                            )
                      : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
