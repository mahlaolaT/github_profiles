// github_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:github_profiles/api/service/github_service.dart';
import 'package:github_profiles/api/client/github_client.dart';
import 'package:github_profiles/api/model/github_repo.dart';
import 'package:github_profiles/api/model/github_search.dart';
import 'package:github_profiles/api/model/github_user_details.dart';

import 'github_service_test.mocks.dart';

@GenerateMocks([GithubClient])
void main() {
  late GithubService service;
  late MockGithubClient mockClient;

  setUp(() {
    mockClient = MockGithubClient();
    service = GithubService(client: mockClient);
  });

  group('GithubService', () {
    test('searchUsers returns GithubSearch result', () async {
      const query = 'flutter';
      final expectedSearch = GithubSearch(totalCount: 1, items: [], incompleteResults: false);

      when(mockClient.searchUser(query))
          .thenAnswer((_) async => expectedSearch);

      final result = await service.searchUsers(query);

      expect(result, equals(expectedSearch));
      verify(mockClient.searchUser(query)).called(1);
    });

    test('getUserDetails returns GithubUserDetails', () async {
      const username = 'john';

      final expectedDetails = GithubUserDetails(
        login: 'john',
        id: 78778,
        nodeId: 'it778',
        avatarUrl: '',
        gravatarId: '',
        url: '',
        htmlUrl: '',
        followersUrl: '',
        followingUrl: '',
        gistsUrl: '',
        starredUrl: '',
        subscriptionsUrl: '',
        organizationsUrl: '',
        reposUrl: '',
        eventsUrl: '',
        receivedEventsUrl: '',
        type: '',
        userViewType: '',
        siteAdmin: false,
        publicRepos: 45,
        publicGists: 56,
        followers: 45,
        following: 90,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(mockClient.userDetails(username))
          .thenAnswer((_) async => expectedDetails);

      final result = await service.getUserDetails(username);

      expect(result, equals(expectedDetails));
      verify(mockClient.userDetails(username)).called(1);
    });

    test('getUserRepos returns a list of repositories', () async {
      const username = 'john';
      final expectedRepos = <GitHubRepository>[];

      when(mockClient.userRepos(username))
          .thenAnswer((_) async => expectedRepos);

      final result = await service.getUserRepos(username);

      expect(result, equals(expectedRepos));
      verify(mockClient.userRepos(username)).called(1);
    });
  });
}
