import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/cubit/github_user_details_cubit.dart';
import 'package:github_profiles/state/github_user_details_state.dart';
import 'package:github_profiles/ui/widget/account_information.dart';
import 'package:github_profiles/ui/widget/account_repos.dart';
import 'package:github_profiles/ui/widget/loading_indicator.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<GithubUserDetailsCubit, GithubUserDetailsState>(
          listener: (context, state) {
            if (state is GithubUserDetailsError) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is GithubUserDetailsLoading) {
              return const LoadingIndicator();
            } else if (state is GithubUserDetailsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AccountInformation(userDetails: state.response),
                  const AccountRepos(),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
