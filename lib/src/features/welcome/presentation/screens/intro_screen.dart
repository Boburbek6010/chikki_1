import 'package:demo1/src/features/welcome/view_model/intro_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class IntroScreen extends ConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:   PageView(
        physics: const BouncingScrollPhysics(),
        controller: ref.read(introVM).pageController,
        onPageChanged: (index) {
          ref.read(introVM).changeIndex(index);
        },
        children: const [

        ],
      ),
    );
  }
}
