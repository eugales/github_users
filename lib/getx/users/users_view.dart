import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:github_users/getx/users/users_controller.dart';

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
            child: Column(
          children: users.map(
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
        )),
      ),
    );
  }
}
