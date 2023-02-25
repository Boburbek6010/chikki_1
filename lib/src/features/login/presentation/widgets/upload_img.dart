import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';

class UploadImg extends StatelessWidget {

  final VoidCallback onPressedUpload;

  const UploadImg({Key? key, required this.onPressedUpload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: 80,
          width: 80,
          decoration: const  BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cF4F4F4,
          ),
          child: AppImages.personPlaceholder,
        ),
        InkWell(
          onTap: onPressedUpload,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            alignment: Alignment.center,
            height: 48,
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.cEFEFEF),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, color: AppColors.c091B3D,),
                Text('uploadImg'.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c091B3D, fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ),

      ],
    );
  }
}


