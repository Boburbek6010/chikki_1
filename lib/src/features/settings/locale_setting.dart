import 'package:flutter/material.dart';

class LocaleSettings extends ChangeNotifier {
  bool isPressed = false;
  String isLanguageChosen = "";

  void ru(){
    isLanguageChosen = "ru";
    isPressed = true;
    notifyListeners();
  }

  void en(){
    isLanguageChosen = "en";
    isPressed = true;
    notifyListeners();
  }

  void uz(){
    isLanguageChosen = "uz";
    isPressed = true;
    notifyListeners();
  }

  void isLangChosen(BuildContext context){

  }

}