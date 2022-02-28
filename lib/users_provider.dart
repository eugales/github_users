import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:github_users/user_model.dart';

class UsersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = UserModel.listFromJson;
    httpClient.addRequestModifier((Request<dynamic> request) {
      request.headers['Accept'] = 'application/vnd.github.v3+json';
      return request;
    });
  }

  Future<Response<List<UserModel>>> getUsers() =>
      get<List<UserModel>>('https://api.github.com/users');
}
