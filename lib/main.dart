import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/user_details_page.dart';
import 'package:github_users/users_binding.dart';
import 'package:github_users/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/users',
      getPages: [
        GetPage(name: '/users', page: () => UsersPage(key: key), binding: UsersBinding()),
        GetPage(name: '/details', page: () => UserDetailsPage())
      ],
    );
  }
}
