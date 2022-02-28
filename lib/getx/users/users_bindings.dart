import 'package:get/instance_manager.dart';
import 'package:github_users/getx/users/users_controller.dart';
import 'package:github_users/repo/persist/users_persist.dart';
import 'package:github_users/repo/service/users_service.dart';
import 'package:github_users/repo/users_repo.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    final UsersService _service = UsersService();
    final UsersPersist _persist = UsersPersist();
    final UsersRepo _repo = UsersRepo(_service, _persist);


    Get.lazyPut(() => UsersController(repo: _repo));
  }
}
