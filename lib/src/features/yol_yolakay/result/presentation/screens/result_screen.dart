import 'package:demo1/src/app.dart';
import 'package:demo1/src/core/style/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dialogue.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBar(
          onPressed: () => showAlertDialog(context),
        ),
      ),
    );
  }
}
