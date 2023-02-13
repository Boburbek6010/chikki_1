import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../features/menu/presentation/screens/home.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({Key? key}) : super(key: key);

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Chikki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
