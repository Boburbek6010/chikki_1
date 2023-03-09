import 'package:Chikki/src/features/yol_yolakay/home/presentation/screens/y_home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/open_part.dart';

class YWelcomeScreen extends StatelessWidget {
  const YWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OpenPart(name: "Yo'l-Yo'lakay", goto: YHomeScreen(),);
  }
}
