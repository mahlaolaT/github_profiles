import 'package:flutter_test/flutter_test.dart';
import 'package:github_profiles/api/service/github_service.dart';

import 'package:github_profiles/main.dart';
import 'package:mockito/annotations.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([GithubService])
void main() {
  late MockGithubService mockGithubService;

  setUp((){
    mockGithubService = MockGithubService();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(GithubExplorerApp(service: mockGithubService));
  });
}
