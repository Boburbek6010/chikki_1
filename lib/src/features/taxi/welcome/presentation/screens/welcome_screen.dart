import 'package:Chikki/src/features/taxi/welcome/presentation/screens/history_welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/open_part.dart';
import 'intro_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OpenPart(name: 'Chikki', goto: HistoryWelcomeScreen(),);
  }
}

