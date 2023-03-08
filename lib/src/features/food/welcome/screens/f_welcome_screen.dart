import 'package:flutter/material.dart';

import '../../../../core/widgets/open_part.dart';
import '../../home/presentation/screens/food_catigories_screen.dart';

class FWelcomeScreen extends StatelessWidget {
  const FWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OpenPart(name: "Chikki Food", goto: FoodCategory(),);
  }
}
