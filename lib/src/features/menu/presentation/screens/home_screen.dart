import 'package:demo1/src/features/menu/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:lottie/lottie.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../core/style/colors.dart';
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
            children:  [
              HomeDrawerBuilder(),
              HomeModelBottomSheet(),

            ],
          ),
           const HomeCarsPositions(),
          ElevatedButton(onPressed: (){
            dialog(context: context);
          },
              child: Text('dialog'))

        ],
      ),
    );
  }
}

class FindCarProcess extends StatelessWidget {
  const FindCarProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

dialog(
    {required BuildContext context}){
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
                 Container(
                   // color: Colors.red,
                   alignment: Alignment.center,
                   child:  Lottie.asset(
                     'assets/lottle/CirclePop.json',
                     // controller: _controller,
                     onLoaded: (composition) {},
                     fit: BoxFit.cover,
                     width: 250,
                     height: 250
                   ),
                 ),
                 Container(
                   height: 282,
                   width: double.infinity,
                   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
                   padding: const EdgeInsets.symmetric( vertical: 16),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: AppColors.white
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           // const SizedBox(width: 5),
                           Text('Mashina qidirilmoqda', style: Theme.of(context).textTheme.titleMedium),
                           const SizedBox.shrink(),
                           const SizedBox.shrink(),
                           const SizedBox.shrink(),
                           Text('15:00', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c2AC1BC)),

                         ],
                       ),
                        Text('data', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292),),
                       Column(
                         children: [
                           LinearTimer(
                           duration: const Duration(seconds: 14),
                           minHeight: 6,
                           color: AppColors.c2AC1BC,
                           backgroundColor: AppColors.transparent,
                           forward: false,
                           onTimerEnd: () {
                             print("timer ended");
                           },
                     ),
                           Transform.translate(
                             offset: const Offset(0, -8),
                             child: const Divider(
                               thickness: 1,
                             ),
                           ),
                         ],
                       ),

                       ElevatedButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },
                           style: ElevatedButton.styleFrom(
                             elevation: 0,
                             shape: const CircleBorder(),
                             backgroundColor: AppColors.cEDEDED,
                             minimumSize: const Size(55, 55),
                           ),
                           child: const Icon(Icons.clear, color: AppColors.black)
                       ),
                       Text('Buyurtmani bekor qilish', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292),),

                     ],
                   ),
                 ),
        ],
      )//Put your screen design here!
    ),
  );
}
