import 'package:demo1/src/features/menu/presentation/widgets/home_drawer_builder.dart';
import 'package:demo1/src/features/menu/presentation/widgets/home_main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/style/colors.dart';


class HomeChooseRouteSheet extends StatelessWidget {
  final VoidCallback onMainButtonPressed;
  const HomeChooseRouteSheet({required this.onMainButtonPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         HomeDrawerBuilder(
          openDrawer: () {  },
          child: const Icon(Icons.arrow_back, size: 23,),
        ),
        Container(
          height: 166,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sergili 3', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),),
                  const Icon(
                    CupertinoIcons.search,
                    color: AppColors.c9DA4B1,
                    size: 26,
                  )
                ],
              ),
              HomeMainButton(
                name: 'Chaqirish',
                onTap: onMainButtonPressed,
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }
}
