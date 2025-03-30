import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';
import 'package:github_profiles/cubit/github_user_details_cubit.dart';
import 'package:github_profiles/router.dart';
import 'package:github_profiles/state/github_search_state.dart';

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
              return const Center(child: CircularProgressIndicator());
            } else if (state is GithubSearchLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                    title: Text(user.login),
                    subtitle: Text(user.type),
                    onTap: () {
                      final userDetailsCubit = context.read<GithubUserDetailsCubit>();
                      userDetailsCubit.fetchUserDetails(user.login);
                      Navigator.of(context).pushNamed(accountDetailsRoute);
                    },
                  );
                },
              );
            } else if (state is GithubSearchError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Enter a search term'));
          },
        ),
      ),
    );
  }
}

class UserSearchField extends StatelessWidget implements PreferredSizeWidget {
  const UserSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search',
          contentPadding: EdgeInsets.only(left: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (query) {
          context.read<GithubSearchCubit>().searchUsers(query);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size(400, 90);
}
