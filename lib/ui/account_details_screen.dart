import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_user_details_cubit.dart';
import 'package:github_profiles/state/github_user_details_state.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GithubUserDetailsCubit, GithubUserDetailsState>(
          builder: (context, state) {
            if (state is GithubUserDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GithubUserDetailsLoaded) {
              final userDetails = state.response;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 24.0,
                        ).copyWith(bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 48.0,
                                  backgroundImage: NetworkImage(
                                    userDetails.avatarUrl,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                // Adds spacing between avatar and text
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userDetails.login,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        userDetails.name ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          userDetails.bio ?? '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: const Divider(),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0).copyWith(top:14.0,bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'followers:${userDetails.followers}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),
                                  ),
                                  Text(
                                    'following: ${userDetails.following}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'public repos:${userDetails.publicRepos}',
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    'public gists: ${userDetails.publicGists}',
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is GithubUserDetailsError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
