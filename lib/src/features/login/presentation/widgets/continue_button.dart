import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';


typedef OnPressedUpload = void Function();

class ContinueButton extends StatelessWidget {

  final OnPressedUpload onPressedContinue;

  const ContinueButton({Key? key, required this.onPressedContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: AppColors.c2AC1BC,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
          ),
          child: Text('introRout1'.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.cFCFCFC),)
      ),
    );
  }
}


