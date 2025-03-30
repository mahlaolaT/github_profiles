import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/service/github_service.dart';
import 'package:github_profiles/state/github_search_state.dart';

/// Cubit for searching GitHub users.
class GithubSearchCubit extends Cubit<GithubSearchState> {
  final GithubService service;

  GithubSearchCubit({required this.service}) : super(GithubSearchInitial());

  Future<void> searchUsers(String query) async {
    emit(GithubSearchLoading());
    try {
      if (query.isNotEmpty) {
        final response = await service.searchUsers(query);
        emit(GithubSearchLoaded(response.items));
      } else {
        emit(GithubSearchInitial());
      }
    } catch (error) {
      emit(GithubSearchError(error.toString()));
    }
  }
}
