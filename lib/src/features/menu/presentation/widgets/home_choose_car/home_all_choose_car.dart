import 'package:demo1/src/core/style/colors.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/menu/presentation/widgets/custom_locator.dart';
import 'package:demo1/src/features/menu/presentation/widgets/home_choose_car/search.dart';
import 'package:flutter/material.dart';

import '../home_main_button.dart';
import 'car_card.dart';

class HomeChooseCar extends StatelessWidget {
  const HomeChooseCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomSearch(),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.60,
              child: DraggableScrollableSheet(
                minChildSize: 0.52,
                initialChildSize: 0.60,
                maxChildSize: 1,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          // controller: scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            height: 5,
                            width: 45,
                            decoration: BoxDecoration(
                                color: AppColors.cE8E9EB,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("Taksi", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Container(
                                    height: 2,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: AppColors.c2AC1BC,
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30,),
                              Text("Yetkazib berish", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c9DA4B1
                              ),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            controller: scrollController,
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: const [
                                  CarCard(),
                                ],
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 160,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppImages.cash,
                      const SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('To\'lov turi', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          Text('To’lov naqd', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c9DA4B1
                          ),),
                        ],
                      ),
                      const Spacer(),
                      AppImages.settings,
                    ],
                  ),
                  HomeMainButton(
                    name: 'Mashina tanlash',
                    onTap: (){},
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            Container(
              alignment: Alignment(0.85, -1),
                child: const CustomLocator()),
          ],
        ),
      ],
    );
  }
}
