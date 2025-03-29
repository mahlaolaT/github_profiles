import 'package:github_profiles/api/model/github_user.dart';

/// States for GitHub user search.
abstract class GithubSearchState {}

class GithubSearchInitial extends GithubSearchState {}

class GithubSearchLoading extends GithubSearchState {}

class GithubSearchLoaded extends GithubSearchState {
  final List<GithubUser> users;
  GithubSearchLoaded(this.users);
}

class GithubSearchError extends GithubSearchState {
  final String message;
  GithubSearchError(this.message);
}