import 'package:github_profiles/api/response/github_repo_response.dart';

/// States for GitHub user repositories.
abstract class GithubUserReposState {}

class GithubUserReposInitial extends GithubUserReposState {}

class GithubUserReposLoading extends GithubUserReposState {}

class GithubUserReposLoaded extends GithubUserReposState {
  final GitHubRepositoryResponse response;
  GithubUserReposLoaded(this.response);
}

class GithubUserReposError extends GithubUserReposState {
  final String message;
  GithubUserReposError(this.message);
}