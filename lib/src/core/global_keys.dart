import 'package:flutter/cupertino.dart';

CustomGlobalKey customGlobalKey = CustomGlobalKey();

class CustomGlobalKey extends ChangeNotifier {
  bool isManualMapChosen = false;
  bool isHomeLocator = false;
  bool isHomeDrawer = false;

  void switchBool() {
    isManualMapChosen = !isManualMapChosen;
    notifyListeners();
  }
}
