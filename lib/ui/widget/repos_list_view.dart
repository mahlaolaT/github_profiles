import 'package:flutter/material.dart';
import 'package:github_profiles/api/model/github_repo.dart';
import 'package:github_profiles/ui/widget/repo_list_item.dart';

class ReposListView extends StatelessWidget {
  final List<GitHubRepository> repositories;

  const ReposListView({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: repositories.length,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) => RepoListItem(
        repository: repositories[index],
      ),
    );
  }
}
