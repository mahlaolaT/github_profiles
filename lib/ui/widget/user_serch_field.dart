import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';

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