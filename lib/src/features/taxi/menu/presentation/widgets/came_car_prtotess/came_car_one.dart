import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../../../../../../core/style/colors.dart';
import '../../../../../../core/style/images.dart';

typedef OnPressed = void Function();

class CameCarProcess extends StatelessWidget {
  final OnPressed cancel;
  final OnPressed onEndTime;
  const CameCarProcess({Key? key, required this.onEndTime, required this.cancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
       mainAxisSize: MainAxisSize.min,
      children: [
        //timer
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: AppColors.white,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 100,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 7,),
                          AppImages.cloc,
                          TimerCountdown(
                            onEnd: onEndTime,
                            enableDescriptions: false,
                            format: CountDownTimerFormat.minutesSeconds,
                            spacerWidth: 1,
                            timeTextStyle: const TextStyle(
                              color: AppColors.white,
                            ),
                            colonsTextStyle: const TextStyle(
                              letterSpacing: -3,
                              color: AppColors.white,
                            ),
                              endTime: DateTime.now().add(
                                const Duration(
                                  minutes: 0,
                                  seconds: 9,
                                ),
                              ),
                          ),
                          const SizedBox(width: 7,),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('Manzil', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c929292), textAlign: TextAlign.start),
                const SizedBox(height: 7),
                //goLocation
                Row(
                  children: [
                    // SizedBox(width: ,)
                    const Icon(CupertinoIcons.location_fill, size: 20),
                    const SizedBox(width: 17),
                    Text('Sergli 3', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600)),

                  ],
                ),
                const SizedBox(height: 12),
                const Divider(thickness: 1),

                //#carInfo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //carInfo
                    Column(
                      // mainAxisAlignment: ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Oq Gentra', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.black), textAlign: TextAlign.start),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          height: 28,
                          width: 97,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.c2AC1BC,
                          ),
                          child: Text('01 T 202 AA', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.white), textAlign: TextAlign.start) ,
                        )
                      ],
                    ),
                    AppImages.selectedCar
                  ],
                ),

                const SizedBox(height: 20),
                //driverInfo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //driverName
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.cEDEDED,
                          ),
                          child: AppImages.driver,
                        ),
                        const SizedBox(height: 8),
                        Text('Akbar', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292))
                      ],
                    ),

                    //massage With driver
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.cEDEDED,
                          ),
                          child: AppImages.driverWithMessage,
                        ),
                        const SizedBox(height: 8),
                        Text('Haydovchi\nbilan aloqa', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292))
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: cancel,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cEDEDED,
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                    child: Text('Bekor qilish', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c929292, fontWeight: FontWeight.w600),)
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

