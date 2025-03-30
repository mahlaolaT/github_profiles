import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_user_repos_cubit.dart';
import 'package:github_profiles/state/github_user_repos_state.dart';
import 'package:github_profiles/ui/widget/loading_indicator.dart';
import 'package:github_profiles/ui/widget/repos_list_view.dart';

class AccountRepos extends StatelessWidget {
  const AccountRepos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubUserReposCubit, GithubUserReposState>(
      listener: (context, state) {
        if (state is GithubUserReposError) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        }
      },
      builder: (context, state) {
        if (state is GithubUserReposLoading) {
          return const LoadingIndicator();
        } else if (state is GithubUserReposLoaded) {
          return Expanded(
            child: ReposListView(repositories: state.repositories),
          );
        }
        return const Expanded(child: Center(child: Text('No repos found.')));
      },
    );
  }
}
