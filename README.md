# github_profiles

Build a mobile application that makes use of the GitHub public Api to retrieve information about GitHub accounts.

## Getting Started

Project uses code generation for client implementation 
use command to generate implementation using build runner 

``` dart pub run build_runner build --delete-conflicting-outputs```

Please enter your github token under main.dart in the token variable

``` 
void main() async {

  const token = 'TOKEN GOES HERE';

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(GithubUserAdapter());
  Hive.registerAdapter(RecentSearchAdapter());

  final dio = Dio()..interceptors.add(AuthorizationInterceptor(token: token));
  runApp(GithubExplorerApp(service: GithubService(client: GithubClient(dio))));
}
```
