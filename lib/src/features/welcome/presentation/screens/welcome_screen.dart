import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/features/welcome/view_model/intro_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AppImages.welcomeImage,
          ),
          // Text(data),
        ],
      ),
    );
  }
}

