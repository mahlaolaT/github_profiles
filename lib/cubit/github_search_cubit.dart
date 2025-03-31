import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/model/github_user.dart';
import 'package:github_profiles/api/service/github_service.dart';
import 'package:github_profiles/state/github_search_state.dart';

/// Cubit for searching GitHub users.
class GithubSearchCubit extends Cubit<GithubSearchState> {
  List<GithubUser> users = [];

  final GithubService service;

  GithubSearchCubit({required this.service}) : super(GithubSearchInitial());

  Future<void> searchUsers(String query) async {
    emit(GithubSearchLoading());
    try {
      if (query.isNotEmpty) {
        final response = await service.searchUsers(query);
        users = response.items;
        emit(GithubSearchLoaded(response.items));
      } else {
        emit(GithubSearchInitial());
      }
    } catch (error) {
      emit(GithubSearchError(error.toString()));
    }
  }

  void refreshUser(GithubUser updatedUser) {
    final updatedList = users.map((user) {
      return user.login == updatedUser.login ? updatedUser : user;
    }).toList();
    emit(GithubSearchLoaded(updatedList));
  }

}
