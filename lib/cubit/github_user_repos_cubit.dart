import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/service/github_service.dart';
import 'package:github_profiles/state/github_user_repos_state.dart';

/// Cubit for fetching GitHub user repositories.
class GithubUserReposCubit extends Cubit<GithubUserReposState> {
  final GithubService service;

  GithubUserReposCubit({required this.service}) : super(GithubUserReposInitial());

  Future<void> fetchUserRepos(String username) async {
    emit(GithubUserReposLoading());
    try {
      final response = await service.getUserRepos(username);
      emit(GithubUserReposLoaded(response));
    } catch (error) {
      emit(GithubUserReposError(error.toString()));
    }
  }
}
