import 'package:Chikki/src/features/food/welcome/screens/f_welcome_screen.dart';
import 'package:Chikki/src/features/yol_yolakay/welcome/screens/y_welcome_screen.dart';

import '../../features/food/home/presentation/screens/food_catigories_screen.dart';
import 'package:Chikki/src/features/yol_yolakay/home/presentation/screens/y_home_screen.dart';

import '../../features/taxi/order/presentation/screens/search_rout_screen.dart';
import 'package:flutter/material.dart';

import '../../features/taxi/login/presentation/screens/register_screen.dart';
import '../../features/taxi/login/presentation/screens/set_profile_screen.dart';
import '../../features/taxi/menu/presentation/screens/home_screen.dart';
import '../../features/taxi/welcome/presentation/screens/intro_screen.dart';
import '../../features/taxi/welcome/presentation/screens/welcome_screen.dart';
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
    AppRouteName.FOODHOME: (context) =>   const FoodCategory(),
    AppRouteName.YHOME: (context) =>   const YHomeScreen(),
    AppRouteName.YWELCOME: (context) =>   const YWelcomeScreen(),
    AppRouteName.FWELCOME: (context) =>   const FWelcomeScreen(),
  };
}