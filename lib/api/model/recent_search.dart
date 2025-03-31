import 'package:hive/hive.dart';

part 'recent_search.g.dart';

@HiveType(typeId: 1)
class RecentSearch extends HiveObject {
  @HiveField(99)
  final String query;

  RecentSearch({
    required this.query,
  });
}
