import 'package:github_profiles/api/model/github_user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  static const String boxName = 'liked_users';

  Future<List<GithubUser>> getLikedUsers() async {
    if ((Hive.isBoxOpen(boxName))) {
      return Hive.box<GithubUser>(boxName)
          .values
          .where((user) => user.liked)
          .toList();
    } else {
      final box = await Hive.openBox<GithubUser>(boxName);
      return box.values.where((user) => user.liked).toList();
    }
  }

  Stream<List<GithubUser>> getLikedUsersStream() async* {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<GithubUser>(boxName);
    }
    final box = Hive.box<GithubUser>(boxName);

    yield box.values.where((user) => user.liked).toList();
    yield* box
        .watch()
        .map((_) => box.values.where((user) => user.liked).toList());
  }

  Future<GithubUser> getLikedUser(GithubUser user) async {
    if ((Hive.isBoxOpen(boxName))) {
      final likedUsers = Hive.box<GithubUser>(boxName).values;
      return likedUsers.where((value) => value.login == user.login).first;
    } else {
      final box = await Hive.openBox<GithubUser>(boxName);
      final likedUsers = box.values;
      return likedUsers.where((value) => value.login == user.login).first;
    }
  }

  Future<void> addLikedUser(GithubUser user) async {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box<GithubUser>(boxName)
        : await Hive.openBox<GithubUser>(boxName);

    final existingKey = box.keys.firstWhere(
      (key) => box.get(key)?.login == user.login,
      orElse: () => null,
    );

    if (existingKey != null) {
      await box.put(existingKey, user); // Update existing
    } else {
      await box.add(user); // Add new
    }
  }

  removeLikedUser(GithubUser user) async {
    if ((Hive.isBoxOpen(boxName))) {
      return Hive.box<GithubUser>(boxName).delete(user);
    } else {
      final box = await Hive.openBox<GithubUser>(boxName);
      await box.delete(user);
    }
  }
}
