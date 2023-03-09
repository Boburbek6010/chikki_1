import 'package:Chikki/src/core/style/colors.dart';
import 'package:Chikki/src/features/taxi/welcome/presentation/screens/intro_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/style/images.dart';
import '../../../settings/make_less.dart';

class HistoryWelcomeScreen extends ConsumerWidget {
  const HistoryWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulWrapper(
      onInit: (){
        Future.delayed(const Duration(seconds: 2)).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen()));
        });
      },
      child: Scaffold(
        backgroundColor: AppColors.c2AC1BC,
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: AppImages.welcomeImage),
            Container(
              margin: const EdgeInsets.only(left: 19, bottom: 61),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Chikki',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 40),
                      ).tr(),
                      const SizedBox(width: 10),
                      Text(
                        'welcome1',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.white, fontSize: 35),
                      ).tr(),
                    ],
                  ),
                  Text(
                    'welcome2',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: AppColors.white, fontSize: 35),
                  ).tr(),
                ],
              ),
            ),
            // Text(data),
          ],
        )
      ),
    );
  }
}
