import 'package:demo1/src/features/order/presentation/screens/search_rout_screen.dart';
import 'package:demo1/src/features/order/view_model/search_route.dart';
import 'package:flutter/material.dart';

import '../../features/login/presentation/screens/register_screen.dart';
import '../../features/login/presentation/screens/set_profile_screen.dart';
import '../../features/menu/presentation/screens/home_screen.dart';
import '../../features/welcome/presentation/screens/intro_screen.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import 'app_route_name.dart';

@immutable
class AppRoutes{
  const AppRoutes._();
  static final Map<String, Widget Function(BuildContext)>routes = {
    AppRouteName.WELCOME: (context) => const WelcomeScreen(),
    AppRouteName.INTRO: (context) => const IntroScreen(),
    AppRouteName.HOME: (context) => HomeScreen(),
    AppRouteName.SETPROFILE: (context) => const SetProfileScreen(),
    AppRouteName.REGISTER: (context) => const RegisterScreen(),
    AppRouteName.SEARCHROUTE: (context) =>   const SearchRoutScreen(),
  };
}