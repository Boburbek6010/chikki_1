import 'package:Chikki/src/core/style/colors.dart';
import 'package:Chikki/src/core/style/images.dart';
import 'package:Chikki/src/features/taxi/login/presentation/widgets/continue_button.dart';
import 'package:flutter/material.dart';

typedef OnPressedUpload = void Function();

void getImage(BuildContext context, OnPressedUpload onPressedGallery, OnPressedUpload onPressedCamera){
  showModalBottomSheet(context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
      ),
      builder: (context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cE8E9EB,
              ),
            ),
            InkWell(
              onTap: onPressedCamera,
              child: Container(
                margin: const EdgeInsets.only(left: 19),
                height: 50,
                child: Row(
                  children: [
                     AppImages.camera,
                    const SizedBox(width: 13),
                     const Text('Kamerani ochish'),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 1, indent: 48, endIndent: 48,),
            InkWell(
              onTap: onPressedGallery,
              child: Container(
                margin: const EdgeInsets.only(left: 19),
                height: 50,
                child: Row(
                  children: [
                     AppImages.gallery,
                     const SizedBox(width: 13),
                     const Text("Fayl orqali yukalsh"),
                  ],
                ),
              ),
            )
          ],
        ),
      )
  );
}