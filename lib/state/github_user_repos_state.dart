import 'package:github_profiles/api/model/github_repo.dart';

/// States for GitHub user repositories.
abstract class GithubUserReposState {}

class GithubUserReposInitial extends GithubUserReposState {}

class GithubUserReposLoading extends GithubUserReposState {}

class GithubUserReposLoaded extends GithubUserReposState {
  final List<GitHubRepository> repositories;
  GithubUserReposLoaded(this.repositories);
}

class GithubUserReposError extends GithubUserReposState {
  final String message;
  GithubUserReposError(this.message);
}