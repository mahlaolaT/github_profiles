import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/service/github_service.dart';
import 'package:github_profiles/state/github_user_details_state.dart';

/// Cubit for retrieving GitHub user details.
class GithubUserDetailsCubit extends Cubit<GithubUserDetailsState> {
  final GithubService service;

  GithubUserDetailsCubit({required this.service})
      : super(GithubUserDetailsInitial());

  Future<void> fetchUserDetails(String username) async {
    emit(GithubUserDetailsLoading());
    try {
      final response = await service.getUserDetails(username);
      emit(GithubUserDetailsLoaded(response));
    } catch (error) {
      emit(GithubUserDetailsError(error.toString()));
    }
  }
}
