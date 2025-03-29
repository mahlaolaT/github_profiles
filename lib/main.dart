import 'package:flutter/material.dart';
import 'package:github_profiles/router.dart';

void main() {
  runApp(const GithubExplorerApp());
}

class GithubExplorerApp extends StatelessWidget {
  const GithubExplorerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Explorer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: homeRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
