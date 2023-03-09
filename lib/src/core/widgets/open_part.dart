import 'package:Chikki/src/core/style/colors.dart';
import 'package:Chikki/src/features/taxi/welcome/presentation/screens/history_welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/taxi/settings/make_less.dart';

class OpenPart extends ConsumerWidget {
  final String name;
  final Widget goto;
  const OpenPart({Key? key, required this.name, required this.goto}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatefulWrapper(
      onInit: (){
        Future.delayed(const Duration(seconds: 2)).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  goto));
        });
      },
      child: Scaffold(
        backgroundColor: AppColors.c2AC1BC,
        body: Center(
          child: Text(name, style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w800,
              color: AppColors.white
          ),),
        ),
      ),
    );
  }
}