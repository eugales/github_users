import 'package:github_users/model/user.dart';
import 'package:github_users/repo/persist/users_persist.dart';
import 'package:github_users/repo/service/users_service.dart';

class UsersRepo {
  UsersService service;
  UsersPersist persist;

  UsersRepo(this.service, this.persist);

  Future<List<User>> getUsers() async {
    List<User> users = await service.getUsers();

    if (users.isEmpty) {
      print("get users from persistance");
    }

    return users;
  }
}
