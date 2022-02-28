import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/users_controller.dart';

class UserDetailsView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              user.avatarUrl,
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          textBox('ID: ', user.id.toString()),
          textBox('Login: ', user.login),
          if (user.name != null) textBox('Name', user.name!),
          if (user.email != null) textBox('Email', user.email!),
          textBox('Followers: ', user.followers.toString()),
          textBox('Following: ', user.following.toString()),
          textBox('Registered Date: ', user.createdAt),
          if (user.company != null) textBox('Company', user.company!),
        ],
      ),
    );
  }
}

Widget textBox(String key, String value) {
  return Container(
    alignment: Alignment.centerLeft,
    width: double.infinity,
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.01),
          offset: const Offset(0, 1),
          blurRadius: 10,
        )
      ],
    ),
    child: Wrap(
      children: [
        Text(key, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    ),
  );
}
