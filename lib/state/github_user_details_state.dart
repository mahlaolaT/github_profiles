
import 'package:github_profiles/api/response/github_user_details_response.dart';

/// States for GitHub user details.
abstract class GithubUserDetailsState {}

class GithubUserDetailsInitial extends GithubUserDetailsState {}

class GithubUserDetailsLoading extends GithubUserDetailsState {}

class GithubUserDetailsLoaded extends GithubUserDetailsState {
  final GithubUserDetailsResponse response;
  GithubUserDetailsLoaded(this.response);
}

class GithubUserDetailsError extends GithubUserDetailsState {
  final String message;
  GithubUserDetailsError(this.message);
}