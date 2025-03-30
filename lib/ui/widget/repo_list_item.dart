import 'package:flutter/material.dart';
import 'package:github_profiles/api/model/github_repo.dart';
import 'package:intl/intl.dart';

import 'copy_button.dart';

class RepoListItem extends StatelessWidget {
  final GitHubRepository repository;

  const RepoListItem({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repository.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: repository.language?.isNotEmpty ?? false,
            child: Text(
              '${repository.language}',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Star gazers: ${repository.stargazersCount}',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Text(
                  'Forks: ${repository.forksCount}',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Text(
                  'Watchers: ${repository.watchersCount}',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Visibility(
            visible: repository.description?.isNotEmpty ?? false,
            child: Text(
              repository.description ?? '',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    repository.url,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CopyButton(textToCopy: repository.url),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0, bottom: 0),
            child: Text(
              'Created: ${DateFormat('MMM d, yyyy').format(repository.createdAt)}',
              style:
                  const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
