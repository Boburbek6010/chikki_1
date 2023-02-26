import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

import '../../../data/entity/yandex_routes.dart';
import '../../../data/repository/app_repository_impl.dart';


final searchRouteVM = ChangeNotifierProvider((ref) => SearchRoutVM());

class SearchRoutVM extends ChangeNotifier {
  TextEditingController myLocationController = TextEditingController();
  TextEditingController goLocationController = TextEditingController();
  List<Feature> locate = [];
  List<Feature> searchLocateList = [];
  bool isLoading = false;

  void closePage(BuildContext context) {
    Navigator.pop(context);
  }


  Future<void> getAllProperties() async {
    final response = await AppRepositoryImpl().getAllRoutes(goLocationController.text.trim().toString(), 'uz');
    locate = response;
    l.w(locate.first);
    notifyListeners();
  }


  // void getAllLocate(){
  //   locate = categoriesMock.map((category) => MocSearch.fromJson(category)).toList();
  // }

  void searchLocate(String search){
    // locate = categoriesMock.map((category) => MocSearch.fromJson(category)).toList();
    searchLocateList = locate;
    notifyListeners();
    if(search.isEmpty){
      locate = [];
    }else{
      locate = searchLocateList.where((element) => element.properties.name.toString().toLowerCase().contains(search.toLowerCase())).toList();
    }
    notifyListeners();
  }

}



