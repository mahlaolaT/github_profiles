import 'dart:async';
import 'package:github_profiles/api/client/github_client.dart';
import 'package:github_profiles/api/response/github_repo_response.dart';
import 'package:github_profiles/api/response/github_search_response.dart';
import 'package:github_profiles/api/response/github_user_details_response.dart';

class GithubService {
  final GithubClient client;

  /// The constructor accepts a required client
  const GithubService({required this.client});

  /// Searches for GitHub users based on the provided query.
  FutureOr<GithubSearchResponse> searchUsers(String query) async {
    try {
      return await client.searchUser(query);
    } catch (error) {
      //TODO: Handle the error, rethrow a custom exception.
      rethrow;
    }
  }

  /// Retrieves detailed information about a specific GitHub user.
  Future<GithubUserDetailsResponse> getUserDetails(String username) async {
    try {
      return await client.userDetails(username);
    } catch (error) {
      //TODO: Handle the error, rethrow a custom exception.
      rethrow;
    }
  }

  /// Fetches repositories for a specific GitHub user.
  Future<GitHubRepositoryResponse> getUserRepos(String username) async {
    try {
      return await client.userRepos(username);
    } catch (error) {
      //TODO: Handle the error, rethrow a custom exception.
      rethrow;
    }
  }
}
