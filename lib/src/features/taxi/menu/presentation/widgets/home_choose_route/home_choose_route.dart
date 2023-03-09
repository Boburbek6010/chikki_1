import 'package:Chikki/src/core/routes/app_route_name.dart';
import 'package:Chikki/src/features/taxi/menu/presentation/widgets/custom_locator.dart';
import 'package:Chikki/src/features/taxi/menu/presentation/widgets/home_drawer_builder.dart';
import 'package:Chikki/src/features/taxi/menu/presentation/widgets/home_main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/style/colors.dart';


class HomeChooseRouteSheet extends StatelessWidget {
  final VoidCallback onLocatorPressed;
  final VoidCallback onMainButtonPressed;
  final String mainNameOfRoute;
  final VoidCallback onBackButtonPressed;
  const HomeChooseRouteSheet({required this.onBackButtonPressed, required this.mainNameOfRoute, required this.onLocatorPressed,required this.onMainButtonPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         HomeDrawerBuilder(
          openDrawer: onBackButtonPressed,
          child: const Icon(Icons.arrow_back, size: 23,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomLocator(
              onTap: onLocatorPressed,
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
                      Text(mainNameOfRoute, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
        ),
      ],
    );
  }
}
