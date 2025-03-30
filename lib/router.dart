import 'package:flutter/material.dart';
import 'package:github_profiles/ui/screens/account_details_screen.dart';
import 'package:github_profiles/ui/screens/home_screen.dart';

const homeRoute = '/';
const accountDetailsRoute = '/accountDetails';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case accountDetailsRoute:
      return MaterialPageRoute(
        builder: (_) => const AccountDetailsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Oops! route unknown ${settings.name}'),
          ),
        ),
      );
  }
}
