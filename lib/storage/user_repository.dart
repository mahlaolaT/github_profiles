import 'package:github_profiles/api/model/github_user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  static const String boxName = 'liked_users';

  Future<List<GithubUser>> getLikedUsers() async {
    if ((Hive.isBoxOpen(boxName))) {
      return Hive.box<GithubUser>(boxName).values.toList();
    } else {
      final box = await Hive.openBox<GithubUser>(boxName);
      return box.values.toList();
    }
  }

  Stream<List<GithubUser>> getLikedUsersStream() async* {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<GithubUser>(boxName);
    }
    final box = Hive.box<GithubUser>(boxName);

    yield box.values.toList();
    yield* box.watch().map((_) => box.values.toList());
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

  addLikedUser(GithubUser user) async {
    if ((Hive.isBoxOpen(boxName))) {
      return Hive.box<GithubUser>(boxName).add(user);
    } else {
      final box = await Hive.openBox<GithubUser>(boxName);
      await box.add(user);
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
