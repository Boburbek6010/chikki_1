import 'package:Chikki/src/core/style/colors.dart';
import 'package:Chikki/src/core/style/images.dart';
import 'package:Chikki/src/features/taxi/login/view_model/register_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/button_sheet.dart';
import '../widgets/nameFields.dart';
import '../widgets/continue_button.dart';

class SetProfileScreen extends ConsumerWidget {
  const SetProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () => ref.read(registerVM).closePage(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.c9DA4B1, size: 22,),
        ),
        title: Text('register'.tr(), style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.c151513),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          //#uploadImg
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //null
              ref.watch(registerVM).file == null ? Container(
                alignment:  Alignment.center,
                height:80,
                width: 80,
                constraints: const BoxConstraints(
                  minWidth: 80,
                  minHeight: 80,
                  maxHeight: 80,
                  maxWidth: 80,
                ),
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cF4F4F4,
                ),
                child:  AppImages.personPlaceholder,
              )
                  :
              // select
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    constraints: const BoxConstraints(
                      minWidth: 80,
                      minHeight:80,
                      maxHeight: 80,
                      maxWidth: 80,
                    ),
                    decoration: const  BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.file(
                      ref.read(registerVM).file!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    onTap: ref.read(registerVM).clear,
                    child: Container(
                      alignment: Alignment.center,
                      height: 24,
                      width: 24,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.cFCFCFC,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: AppColors.black.withOpacity(0.1)
                          )
                        ]
                      ),
                      child: const Icon(Icons.clear, size: 18, color: AppColors.c6F767E,),
                    ),
                  )
                ],
              ),

              //upload Button
              InkWell(
                onTap: () => getImage(context, () => ref.read(registerVM).gallery(context), () => ref.read(registerVM).camera(context)),
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
          ),

          const SizedBox(height: 30),
          const NameFields(),

          const SizedBox(height: 12),
          ContinueButton(onPressedContinue: () {},),
        ],
      ),
    );
  }
}


