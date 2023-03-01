import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class CustomLocator extends StatelessWidget {
  const CustomLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15),
      child: MaterialButton(
        splashColor: AppColors.white,
        height: 54,
        minWidth: 54,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        color: AppColors.c2AC1BC,
        onPressed: (){
          // ref.read(homeVM).findLocation();
          // l.w("locator");
        },
        child: AppImages.homeLocator,
      ),
    );
  }
}
