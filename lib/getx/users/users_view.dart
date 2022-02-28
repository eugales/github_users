import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:github_users/getx/users/users_controller.dart';
import 'package:github_users/model/user.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = controller.users;

    controller.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: users.value,
            builder: ((context, AsyncSnapshot<List<User>> snapshot) {
              final usersList = snapshot.data;
              if (usersList != null) {
                return Column(
                  children: usersList.map(
                    (user) {
                      final avatarUrl = user.avatarUrl == "" ? "https://dummyimage.com/40x40" : user.avatarUrl;
                      return ListTile(
                        leading: Image.network(avatarUrl),
                        title: Text(user.login),
                        subtitle: Text(user.id.toString()),
                        onTap: () {
                          //user details page
                        },
                      );
                    },
                  ).toList(),
                );
              }

              return Container();
            }),
          ),
        ),
      ),
    );
  }
}
