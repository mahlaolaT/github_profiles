import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';
import 'package:github_profiles/state/github_search_state.dart';
import 'package:github_profiles/ui/widget/loading_indicator.dart';
import 'package:github_profiles/ui/widget/user_serch_field.dart';
import 'package:github_profiles/ui/widget/users_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const UserSearchField(),
        body: BlocBuilder<GithubSearchCubit, GithubSearchState>(
          builder: (context, state) {
            if (state is GithubSearchLoading) {
              return const LoadingIndicator();
            } else if (state is GithubSearchLoaded) {
              return UsersListView(users: state.users);
            }
            return const Center(child: Text('Enter a search term'));
          },
        ),
      ),
    );
  }
}


