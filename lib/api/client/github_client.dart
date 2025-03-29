import 'package:github_profiles/api/response/github_repo_response.dart';
import 'package:github_profiles/api/response/github_search_response.dart';
import 'package:github_profiles/api/response/github_user_details_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'github_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GithubClient{

  factory GithubClient(Dio dio,{String? baseUrl }) = _GithubClient;

  @GET('/search/users?q={query}')
  Future<GithubSearchResponse> searchUser(@Query('query') String? query);

  @GET('/users/{username}')
  Future<GithubUserDetailsResponse> userDetails(@Path('username') String? username);

  @GET('/users/{username}/repos')
  Future<GitHubRepositoryResponse> userRepos(@Path('username') String? username);

}