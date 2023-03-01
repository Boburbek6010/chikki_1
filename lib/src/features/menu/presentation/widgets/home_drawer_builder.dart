import 'package:demo1/src/core/global_keys.dart';
import 'package:demo1/src/features/welcome/presentation/widgets/intro_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class HomeDrawerBuilder extends StatelessWidget {
  final Widget child;
  final OnPressedCallBack openDrawer;
  const HomeDrawerBuilder({required this.child, required this.openDrawer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 48, left: 24),
      height: 52,
      width: 52,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.c616161,
              offset: Offset(0, 1), //(x,y)
              blurRadius: 40,
              spreadRadius: 1),
        ],
      ),
      child: MaterialButton(
        shape: const CircleBorder(),
        splashColor: AppColors.c2AC1BC,
        onPressed: openDrawer,
        child: child,
      ),
    );
  }
}
