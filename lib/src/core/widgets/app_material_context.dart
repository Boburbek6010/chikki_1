import 'package:demo1/src/features/login/presentation/screens/register_screen.dart';
import 'package:demo1/src/features/welcome/presentation/screens/intro_screen.dart';
import 'package:demo1/src/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../features/login/presentation/screens/set_profile_screen.dart';
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
      initialRoute: '/intro',
      routes: {
        '/initial': (context) => const WelcomeScreen(),
        '/intro': (context) => const IntroScreen(),
        '/home': (context) => const HomeScreen(),
        '/set_profile': (context) => const SetProfileScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
/// screens
// const HomePage()
 // const WelcomeScreen(),
 // const RegistrationScreen(),

