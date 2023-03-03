import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checker = ChangeNotifierProvider((ref) => CustomChecker());


class CustomChecker extends ChangeNotifier{

  String names = 'first_home';

  void changeName(String name){
    names = name;
    notifyListeners();
  }


  bool fromSearchToHome = false;
  bool fromRouteToCar = false;
  bool fromCameCarToArrive = false;

  void sBackFromSearchToHome(){
    fromSearchToHome = true;
    notifyListeners();
  }

  void sBackFromSearchToHomeFalse(){
    fromSearchToHome = false;
    notifyListeners();
  }

  void fFromRouteToCar(){
    fromRouteToCar = true;
    notifyListeners();
  }

  void fFromRouteToCarFalse(){
    fromRouteToCar = false;
    notifyListeners();
  }

  void fFromCameCarToArrive(){
    fromCameCarToArrive = true;
    notifyListeners();
  }

  void fFromCameCarToArriveFalse(){
    fromCameCarToArrive = false;
    notifyListeners();
  }



}