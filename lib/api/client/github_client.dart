import 'package:github_profiles/api/model/github_repo.dart';
import 'package:github_profiles/api/model/github_search.dart';
import 'package:github_profiles/api/model/github_user_details.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'github_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class GithubClient{

  factory GithubClient(Dio dio,{String? baseUrl }) = _GithubClient;

  @GET('/search/users')
  Future<GithubSearch> searchUser(@Query('q') String? query);

  @GET('/users/{username}')
  Future<GithubUserDetails> userDetails(@Path('username') String? username);

  @GET('/users/{username}/repos')
  Future<List<GitHubRepository>> userRepos(@Path('username') String? username);

}