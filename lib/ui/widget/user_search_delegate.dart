import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/model/recent_search.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';
import 'package:github_profiles/state/github_search_state.dart';
import 'package:github_profiles/storage/recent_search_repository.dart';
import 'package:github_profiles/ui/widget/users_list_view.dart';

import 'loading_indicator.dart';

class UserSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _saveToRecentSearches(context.read<RecentSearchRepository>());
    return BlocBuilder<GithubSearchCubit, GithubSearchState>(
      bloc: context.read<GithubSearchCubit>()
        ..searchUsers(query),
      builder: (context, state) {
        if (state is GithubSearchLoading) {
          return const LoadingIndicator();
        } else if (state is GithubSearchLoaded) {
          return UsersListView(users: state.users);
        }
        return const Center(child: Text('Enter a search term'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<RecentSearch>>(
      future: context.read<RecentSearchRepository>().getRecentSearches(),
      builder: (context, snapshot) {
        final suggestions = snapshot.data ?? [];
        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              leading: const Icon(Icons.history),
              title: Text(suggestion.query),
              onTap: () {
                query = suggestion.query;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  void _saveToRecentSearches(RecentSearchRepository recentSearchRepo) async {
    final recentSearches = await recentSearchRepo.getRecentSearches();
    final exists = recentSearches.any((item) => item.query == query);
    if (!exists && query
        .trim()
        .isNotEmpty) {
      recentSearchRepo.addRecentSearch(RecentSearch(query: query));
    }
  }
}
