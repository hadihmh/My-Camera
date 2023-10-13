import 'package:my_test/domain/api/base_api.dart';
import 'package:my_test/domain/config/routes.dart';
import 'package:my_test/domain/models/data_model.dart';

class CallApis extends BaseAPI {
  Future<List<DataModel>> getPosts() async {
    var result = await get<List<dynamic>>(route: Routes.posts);
    return result?.map((e) => DataModel.fromJson(e)).toList() ?? [];
  }

  Future<List<DataModel>> getUsers() async {
    var result = await get<List<dynamic>>(route: Routes.users);
    return result?.map((e) => DataModel.fromJson(e)).toList() ?? [];
  }
}
