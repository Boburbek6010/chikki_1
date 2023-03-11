import 'dart:developer';

import 'package:Chikki/src/core/style/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/style/colors.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../../../home/presentation/widgets/custom_dialogue.dart';
import '../../../home/view_model/y_home_vm.dart';
import '../widgets/karochi_widget.dart';


class AnnouncementScreen extends ConsumerWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(
          onPressed: () => showAlertDialog(context),
          backButton: (){
            ref.read(yHomeVM).controller.future.whenComplete(() {
              log('aaaa');
              log('aaaa');
              log('aaaa');
              log('aaaa');
              log('aaaa');
              ref.read(yHomeVM).end();
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body: Column(

        children: [
          const SizedBox(height: 30),
        Container(
        height: 70,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.cF4F4F4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: AppImages.image1,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Islom', style: Theme.of(context).textTheme.labelLarge,),
                    Text('Spark', style: Theme.of(context).textTheme.labelMedium,),

                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('150 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
                Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
              ],
            )
          ],
        ),
      ),
          const SizedBox(height: 12),

          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cF4F4F4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: AppImages.image2,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sarvar', style: Theme.of(context).textTheme.labelLarge,),
                        Text('Cobalt', style: Theme.of(context).textTheme.labelMedium,),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('200 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
                    Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 12),


          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cF4F4F4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: AppImages.image3,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Aziz', style: Theme.of(context).textTheme.labelLarge,),
                        Text('Ravon', style: Theme.of(context).textTheme.labelMedium,),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('180 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
                    Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 12),


          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cF4F4F4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: AppImages.image4,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Odil', style: Theme.of(context).textTheme.labelLarge,),
                        Text('Nexia', style: Theme.of(context).textTheme.labelMedium,),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('150 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
                    Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 12),


          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cF4F4F4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: AppImages.image5,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Doniyor', style: Theme.of(context).textTheme.labelLarge,),
                        Text('Epica', style: Theme.of(context).textTheme.labelMedium,),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('220 000 so’m', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.c2AC1BC),),
                    Text('01.09.2022  13:00', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}


