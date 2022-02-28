import 'package:flutter/material.dart';
import 'package:github_users/user_details_view.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: UserDetailsView());
  }
}
