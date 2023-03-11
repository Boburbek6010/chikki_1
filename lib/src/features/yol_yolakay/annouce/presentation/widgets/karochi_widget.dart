import 'package:flutter/material.dart';

import '../../../../../core/style/colors.dart';
class Eeeeh extends StatelessWidget {
  final String name;
  final String carName;
  final Image image;
  const Eeeeh({Key? key, required this.image, required this.carName, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cF4F4F4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: image,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: Theme.of(context).textTheme.labelLarge,),
                  Text(carName, style: Theme.of(context).textTheme.labelMedium,),

                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('150 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
              Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
            ],
          )
        ],
      ),
    );
  }
}
