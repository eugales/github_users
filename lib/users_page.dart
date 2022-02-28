import 'package:flutter/material.dart';
import 'package:github_users/users_view.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Github Users')),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UsersView()),
    );
  }
}
