import 'package:flutter/material.dart';
import 'package:github_profiles/ui/account_details_screen.dart';
import 'package:github_profiles/ui/home_screen.dart';

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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
          case '/second':
            return MaterialPageRoute(
              builder: (_) => const AccountDetailsScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text('Ops! route unknown ${settings.name}'),
                ),
              ),
            );
        }
      },
    );
  }
}
