import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';

typedef OnPressedCallBack = void Function();

class IntroButton extends StatelessWidget {
  final String text;
  final OnPressedCallBack onPressed;

  const IntroButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: AppColors.c2AC1BC,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )
        ),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),),
      ),
    );
  }
}
