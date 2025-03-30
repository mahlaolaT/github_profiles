import 'package:hive/hive.dart';

part 'github_user.g.dart';

@HiveType(typeId: 0)
class GithubUser extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String login;

  @HiveField(2)
  final String avatarUrl;

  @HiveField(3)
  bool liked;

  @HiveField(4)
  final String nodeId;

  @HiveField(5)
  final String gravatarId;

  @HiveField(6)
  final String url;

  @HiveField(7)
  final String htmlUrl;

  @HiveField(8)
  final String followersUrl;

  @HiveField(9)
  final String followingUrl;

  @HiveField(10)
  final String gistsUrl;

  @HiveField(11)
  final String starredUrl;

  @HiveField(12)
  final String subscriptionsUrl;

  @HiveField(13)
  final String organizationsUrl;

  @HiveField(14)
  final String reposUrl;

  @HiveField(15)
  final String eventsUrl;

  @HiveField(16)
  final String receivedEventsUrl;

  @HiveField(17)
  final String type;

  @HiveField(18)
  final String userViewType;

  @HiveField(19)
  final bool siteAdmin;

  @HiveField(20)
  final double score;

  GithubUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.userViewType,
    required this.siteAdmin,
    required this.score,
    this.liked = false,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      gravatarId: json['gravatar_id'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      userViewType: json['user_view_type'] as String,
      siteAdmin: json['site_admin'] as bool,
      score: (json['score'] != null) ? (json['score'] as num).toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'gravatar_id': gravatarId,
      'url': url,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'user_view_type': userViewType,
      'site_admin': siteAdmin,
      'score': score,
    };
  }
}
