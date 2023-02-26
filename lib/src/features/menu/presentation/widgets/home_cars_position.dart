import 'package:flutter/material.dart';

import '../../../../core/style/images.dart';

class HomeCarsPositions extends StatelessWidget {
  const HomeCarsPositions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImages.homeCar1,
            const SizedBox(width: 200,),
            AppImages.homeCar2,
          ],
        ),
        const SizedBox(height: 100,),
        Center(child: AppImages.homeCar3),
      ],
    );
  }
}
