import 'package:flutter/material.dart';
import 'package:github_profiles/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/model/github_user.dart';
import 'package:github_profiles/cubit/github_user_details_cubit.dart';
import 'package:github_profiles/cubit/github_user_repos_cubit.dart';
import 'package:github_profiles/storage/user_repository.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final GithubUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
      title: Text(user.login),
      subtitle: Text(user.type),
      onTap: () {
        final userDetailsCubit = context.read<GithubUserDetailsCubit>();
        final userReposCubit = context.read<GithubUserReposCubit>();
        userDetailsCubit.fetchUserDetails(user.login);
        userReposCubit.fetchUserRepos(user.login);
        Navigator.of(context).pushNamed(accountDetailsRoute);
      },
      trailing: IconButton(
        icon: Icon(
          user.liked ? Icons.favorite : Icons.favorite_border,
          color: user.liked ? Colors.red : Colors.grey,
        ),
        onPressed: () async {
          final userRepo = context.read<UserRepository>();
          userRepo.addLikedUser(user..liked = !user.liked);
        },
      ),
    );
  }
}
