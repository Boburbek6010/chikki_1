import 'package:demo1/src/core/routes/app_route_name.dart';
import 'package:demo1/src/core/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


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
      theme: ThemeData(),
      initialRoute: AppRouteName.HOME,
      routes: AppRoutes.routes,
    );
  }
}
/// screens
// const HomePage()
 // const WelcomeScreen(),
 // const RegistrationScreen(),

