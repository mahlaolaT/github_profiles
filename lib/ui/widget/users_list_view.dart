import 'package:flutter/material.dart';
import 'package:github_profiles/api/model/github_user.dart';
import 'package:github_profiles/ui/widget/user_list_item.dart';

class UsersListView extends StatelessWidget {
  final List<GithubUser> users;

  const UsersListView({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (_, index) => UserListItem(user: users[index]),
    );
  }
}