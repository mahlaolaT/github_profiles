
import 'package:github_profiles/api/model/github_user_details.dart';

/// States for GitHub user details.
abstract class GithubUserDetailsState {}

class GithubUserDetailsInitial extends GithubUserDetailsState {}

class GithubUserDetailsLoading extends GithubUserDetailsState {}

class GithubUserDetailsLoaded extends GithubUserDetailsState {
  final GithubUserDetails response;
  GithubUserDetailsLoaded(this.response);
}

class GithubUserDetailsError extends GithubUserDetailsState {
  final String message;
  GithubUserDetailsError(this.message);
}