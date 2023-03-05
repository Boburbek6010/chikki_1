import 'package:demo1/src/core/style/colors.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              AppImages.carChoose,
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Chikki', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),),
                  Text(' 1 min', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.c9DA4B1
                  ),)
                ],
              ),
              const Spacer(),
              Text('3000 so\'m', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),),
            ],
          ),
        ),
        Divider(
          indent: MediaQuery.of(context).size.width*0.2,
          height: 20,
        ),
      ],
    );
  }
}
