import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';

class UserSearchField extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController _controller = TextEditingController();
  final List<String> _recentSearches = [];

  UserSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        if (_recentSearches.isNotEmpty)
          Wrap(
            spacing: 8.0,
            children: _recentSearches.map((query) {
              return ActionChip(
                label: Text(query),
                onPressed: () {
                  _controller.text = query;

                  if (query.trim().isEmpty) return;
                  context.read<GithubSearchCubit>().searchUsers(query);

                  _recentSearches.remove(query);
                  _recentSearches.insert(0, query);
                  if (_recentSearches.length > 5) {
                    _recentSearches.removeLast(); // Limit to 5
                  }
                },
              );
            }).toList(),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(400, 90);
}
