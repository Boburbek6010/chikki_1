import 'package:demo1/src/core/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/nameFields.dart';
import '../widgets/upload_img.dart';

class SetProfileScreen extends StatelessWidget {
  const SetProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text('register'.tr(), style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c151513),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          UploadImg(onPressedUpload: () {},),
          const SizedBox(height: 30),
          const NameFields(),
        ],
      ),
    );
  }
}
