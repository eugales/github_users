import 'package:get/get.dart';
import 'package:github_users/users_controller.dart';
import 'package:github_users/users_provider.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersProvider());
    Get.put(UsersController(usersProvider: Get.find()));
  }
}
