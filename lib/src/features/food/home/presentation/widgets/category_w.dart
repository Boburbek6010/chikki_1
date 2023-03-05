import 'package:flutter/material.dart';

import '../../../../../core/style/colors.dart';
import '../../../../../core/style/images.dart';
class FoodWidget extends StatelessWidget {
  const FoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //section one
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kombo set B',style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 21)),
                  const SizedBox(height: 3),
                  Text('Kartoshka fri, burger va\ncoca cola 0.5l',style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14,color: AppColors.c9DA4B1)),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text('19 000 so’m',style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 16,color: AppColors.c9DA4B1, decoration: TextDecoration.lineThrough)),
                      const SizedBox(width: 12),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.cE84A54,
                        ),
                        child: Text('15 000 so’m', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white, fontWeight: FontWeight.w600, fontSize: 14),),
                      )
                    ],
                  )
                ],
              ),

              // section Two
              InkWell(
                onTap: (){},
                onLongPress: (){},
                child: Container(
                  width: 120,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppImages.categoryFood,
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
