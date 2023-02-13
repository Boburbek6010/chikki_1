import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/widgets/app_material_context.dart';

class App extends StatelessWidget {
  const App({super.key});

  static void run() => runApp(const App());

  @override
  Widget build(BuildContext context) => EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const AppMaterialContext());
}
