import 'package:github_profiles/api/response/github_search_response.dart';

/// States for GitHub user search.
abstract class GithubSearchState {}

class GithubSearchInitial extends GithubSearchState {}

class GithubSearchLoading extends GithubSearchState {}

class GithubSearchLoaded extends GithubSearchState {
  final GithubSearchResponse response;
  GithubSearchLoaded(this.response);
}

class GithubSearchError extends GithubSearchState {
  final String message;
  GithubSearchError(this.message);
}