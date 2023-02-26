
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MocSearch.dart';


final searchRouteVM = ChangeNotifierProvider((ref) => SearchRoutVM());

class SearchRoutVM extends ChangeNotifier {
  TextEditingController myLocationController = TextEditingController();
  TextEditingController goLocationController = TextEditingController();
  List<MocSearch> locate = [];
  List<MocSearch> searchLocateList = [];
  bool autoFocus = false;

  void closePage(BuildContext context) {
    Navigator.pop(context);
  }

  void getAllLocate(){
    locate = categoriesMock.map((category) => MocSearch.fromJson(category)).toList();
  }

  void searchLocate(String search){
    locate = categoriesMock.map((category) => MocSearch.fromJson(category)).toList();
    searchLocateList = locate;
    notifyListeners();
    if(search.isEmpty){
      locate = [];
    }else{
      locate = searchLocateList.where((element) => element.street.toString().toLowerCase().contains(search.toLowerCase())).toList();
    }
    notifyListeners();
  }

  void selectLocate(int id, String street){
    goLocationController.text = street;
    autoFocus = false;
    notifyListeners();
  }

}



