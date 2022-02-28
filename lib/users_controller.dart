import 'package:get/get.dart';
import 'package:github_users/user_model.dart';
import 'package:github_users/users_provider.dart';

class UsersController extends GetxController with StateMixin<List<UserModel>> {
  final UsersProvider usersProvider;
  UsersController({required this.usersProvider});

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() {
    usersProvider.getUsers().then((result) {
      List<UserModel>? data = result.body;
      if (data != null) {
        change(data, status: RxStatus.success());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
