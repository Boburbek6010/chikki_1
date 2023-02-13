import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/welcome/presentation/screens/intro_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/style/colors.dart';


class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
              child: AppImages.welcomeImage
          ),
          Container(
            margin: const EdgeInsets.only(left: 19, bottom: 61),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('Chikki', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),).tr(),
                    const SizedBox(width: 10),
                    Text('welcome1', textAlign: TextAlign.start, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white),).tr(),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('welcome2', textAlign: TextAlign.start, style: Theme.of(context).textTheme.displaySmall?.copyWith(color: AppColors.white),).tr(),
                    AppImages.welcomeArm
                  ],
                ),

              ],
            ),
          ),
          // Text(data),
        ],
      ),
    );
  }
}




