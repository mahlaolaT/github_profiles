import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/model/github_user.dart';
import 'package:github_profiles/storage/user_repository.dart';
import 'package:github_profiles/ui/widget/no_liked_users.dart';
import 'package:github_profiles/ui/widget/user_search_delegate.dart';
import 'package:github_profiles/ui/widget/users_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: UserSearchDelegate());
              },
            )
          ],
        ),
        body: StreamBuilder<List<GithubUser>>(
          stream: context.read<UserRepository>().getLikedUsersStream(),
          builder: (context, snapshot) {
            final users = snapshot.data ?? [];
            if (users.isNotEmpty) {
              return UsersListView(users: users);
            } else {
              return const NoLikedUsers();
            }
          },
        ),
      ),
    );
  }
}
