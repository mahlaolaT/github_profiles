import 'package:github_profiles/api/model/recent_search.dart';
import 'package:hive/hive.dart';

class RecentSearchRepository {
  static const String boxName = 'recent_search';

  Future<List<RecentSearch>> getRecentSearches() async {
    if ((Hive.isBoxOpen(boxName))) {
      return Hive.box<RecentSearch>(boxName).values.toList();
    } else {
      final box = await Hive.openBox<RecentSearch>(boxName);
      return box.values.toList();
    }
  }

  addRecentSearch(RecentSearch recentSearch) async {
    if ((Hive.isBoxOpen(boxName))) {
      await Hive.box<RecentSearch>(boxName).add(recentSearch);
    } else {
      final box = await Hive.openBox<RecentSearch>(boxName);
      box.add(recentSearch);
    }
  }

  removeRecentSearch(RecentSearch recentSearch) async {
    if ((Hive.isBoxOpen(boxName))) {
      await Hive.box<RecentSearch>(boxName).delete(recentSearch);
    } else {
      final box = await Hive.openBox<RecentSearch>(boxName);
      box.add(recentSearch);
    }
  }
}
