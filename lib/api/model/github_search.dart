import 'github_user.dart';

class GithubSearch {
  final int totalCount;
  final bool incompleteResults;
  final List<GithubUser> items;

  GithubSearch({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory GithubSearch.fromJson(Map<String, dynamic> json) {
    return GithubSearch(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((item) => GithubUser.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}


