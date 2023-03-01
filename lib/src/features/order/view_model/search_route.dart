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
    l.w(locate.first.properties.name);
    notifyListeners();
  }

  void searchLocate(String search){
    searchLocateList = locate;
    if(search.isEmpty){
      // locate = [];
    }else{
      locate = searchLocateList.where((element) => element.properties.name.toString().toLowerCase().contains(search.toLowerCase())).toList();
    }
    notifyListeners();
  }

  void selectLocate(int id, String street){
    goLocationController.text = street;
    notifyListeners();
  }

}



