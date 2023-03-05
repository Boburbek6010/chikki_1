import 'package:demo1/src/core/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NameFields extends StatelessWidget {
  const NameFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('name'.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c091B3D)),
                Container(
                  height: 55,

                  decoration: BoxDecoration(
                    color: AppColors.cF4F4F4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c091B3D, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(width: 6),

          //lastName
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('lastName'.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c091B3D)),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.cF4F4F4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c091B3D, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
