import '../entity/yandex_routes.dart';

abstract class AppRepository {

  Future<List<Feature>> getAllRoutes(String nameController, String lang);

}