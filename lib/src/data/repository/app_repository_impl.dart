import 'package:demo1/src/data/entity/yandex_routes.dart';
import 'package:demo1/src/data/repository/app_repository.dart';
import 'package:demo1/src/data/service/network_service.dart';

class AppRepositoryImpl implements AppRepository{
  @override
  Future<List<Feature>> getAllRoutes(String nameController, String lang) async {
    final response = await NetworkService.GET(NetworkService.apiGetAllRoutes, NetworkService.paramsYandex(nameController, lang));
    final data = yandexRoutesModelFromJson(response);
    return data.features;
  }

}