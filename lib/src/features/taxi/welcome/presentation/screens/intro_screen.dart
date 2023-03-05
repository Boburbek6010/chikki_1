import 'package:demo1/src/core/routes/app_route_name.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/taxi/menu/presentation/screens/home_screen.dart';
import 'package:demo1/src/features/taxi/welcome/view_model/intro_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/style/colors.dart';
import '../widgets/intro_button.dart';
import '../widgets/intro_one.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: ref.read(introVM).pageController,
              onPageChanged: (index) {
                ref.read(introVM).changeIndex(index);
              },
              children: [
                IntroOne(
                  image: AppImages.introImage1,
                  message: 'message1'.tr(),
                ),
                IntroOne(
                  image: AppImages.introImage2,
                  message: 'message2'.tr(),
                ),
                IntroOne(
                  image: AppImages.introImage3,
                  message: 'message3'.tr(),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: ref.read(introVM).pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.c2AC1BC,
              dotColor: AppColors.cD9D9D9,
              dotHeight: 6,
              dotWidth: 10,
              spacing: 3,
            ),
          ),
          const SizedBox(height: 80),
          IntroButton(
            onPressed: () {
              if (ref.read(introVM).pageIndex == 2) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouteName.HOME, (route) => false);
              } else {
                ref.read(introVM).moveToNextPage();
              }
            },
            text: ref.watch(introVM).pageIndex == 2
                ? 'introRout2'.tr()
                : 'introRout1'.tr(),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
