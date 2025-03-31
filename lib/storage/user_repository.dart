import 'package:github_profiles/api/model/github_user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  static const String boxName = 'liked_users';

  Future<Box<GithubUser>> githubUserBox() async => (Hive.isBoxOpen(boxName))
      ? Hive.box<GithubUser>(boxName)
      : await Hive.openBox<GithubUser>(boxName);

  Future<List<GithubUser>> getLikedUsers() async {
    final box = await githubUserBox();
    return box.values.toList();
  }

  Future<GithubUser> getLikedUser(GithubUser user) async {
    final box = await githubUserBox();
    return box.values.where((value) => value.login == user.login).first;
  }

  addLikedUser(GithubUser user) async {
    final box = await githubUserBox();
    await box.add(user);
  }

  removeLikedUser(GithubUser user) async {
    final box =  await githubUserBox();
    await box.delete(user);
  }
}