
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

findCarDialog({required BuildContext context, required VoidCallback onCancel, required VoidCallback onTimeEnd}){
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
        backgroundColor: Colors.grey.withOpacity(.1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox.shrink(),
            Stack(
              alignment: Alignment.center,
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.3)
                    ),
                    child: AppImages.findLocator)
              ],
            ),

            Container(
              height: 262,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
              padding: const EdgeInsets.symmetric( vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // const SizedBox(width: 5),
                      Text('findCar'.tr(), style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox.shrink(),
                      const SizedBox.shrink(),
                      const SizedBox.shrink(),
                      Text('15:00', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c2AC1BC)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 23),
                      Text('chooseCare'.tr(),   style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292),textAlign: TextAlign.start,),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      LinearTimer(
                        duration: const Duration(seconds: 6),
                        minHeight: 6,
                        color: AppColors.c2AC1BC,
                        backgroundColor: AppColors.transparent,
                        forward: false,
                        onTimerEnd: onTimeEnd,
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
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const CircleBorder(),
                        backgroundColor: AppColors.cEDEDED,
                        minimumSize: const Size(55, 55),
                      ),
                      child: const Icon(Icons.clear, color: AppColors.black)
                  ),
                  Text('cancel'.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292), textAlign: TextAlign.center),

                ],
              ),
            ),
          ],
        )//Put your screen design here!
    ),
  );
}
