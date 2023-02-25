import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/menu/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

import '../../../../core/style/colors.dart';

class HomeModelBottomSheet extends ConsumerWidget {
  const HomeModelBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeVM);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, bottom: 15),
          child: MaterialButton(
            splashColor: AppColors.white,
            height: 54,
            minWidth: 54,
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            color: AppColors.c2AC1BC,
            onPressed: (){
              ref.read(homeVM).findLocation();
              l.w("locator");
            },
            child: AppImages.homeLocator,
          ),
        ),
        Container(
          height: 170,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),

              ///top indicator
              Container(
                height: 5,
                width: 45,
                decoration: BoxDecoration(
                    color: AppColors.cE8E9EB,
                    borderRadius: BorderRadius.circular(10)),
              ),

              const SizedBox(
                height: 10,
              ),

              /// qayerga boramiz
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.cE8E9EB),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      AppImages.homeModalBottomSheetCar,
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Qayerga boramiz?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              /// yo'l-yo'lakay, chikki food
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cE8E9EB),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            AppImages.homeModalBottomSheetCar,
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Yo’l-yo’lakay",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 15,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cE8E9EB),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            AppImages.homeChikkiFood,
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Chikki food",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
