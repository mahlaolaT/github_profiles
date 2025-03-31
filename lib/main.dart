import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profiles/api/client/authorization_interceptor.dart';
import 'package:github_profiles/cubit/github_search_cubit.dart';
import 'package:github_profiles/cubit/github_user_details_cubit.dart';
import 'package:github_profiles/cubit/github_user_repos_cubit.dart';
import 'package:github_profiles/router.dart';

import 'api/client/github_client.dart';
import 'api/service/github_service.dart';


void main() async {
  const token = '';
  final dio = Dio()..interceptors.add(AuthorizationInterceptor(token: token));

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GithubUserAdapter());

  runApp(GithubExplorerApp(service: GithubService(client: GithubClient(dio))));
}

class GithubExplorerApp extends StatelessWidget {
  final GithubService service;

  const GithubExplorerApp({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GithubSearchCubit(service: service),
        ),
        BlocProvider(
          create: (context) => GithubUserDetailsCubit(service: service),
        ),
        BlocProvider(
          create: (context) => GithubUserReposCubit(service: service),
        )
      ],
      child: MaterialApp(
        title: 'Github Explorer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: homeRoute,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
