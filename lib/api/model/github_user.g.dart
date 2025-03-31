// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubUserAdapter extends TypeAdapter<GithubUser> {
  @override
  final int typeId = 0;

  @override
  GithubUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubUser(
      login: fields[1] as String,
      id: fields[0] as int,
      nodeId: fields[4] as String,
      avatarUrl: fields[2] as String,
      gravatarId: fields[5] as String,
      url: fields[6] as String,
      htmlUrl: fields[7] as String,
      followersUrl: fields[8] as String,
      followingUrl: fields[9] as String,
      gistsUrl: fields[10] as String,
      starredUrl: fields[11] as String,
      subscriptionsUrl: fields[12] as String,
      organizationsUrl: fields[13] as String,
      reposUrl: fields[14] as String,
      eventsUrl: fields[15] as String,
      receivedEventsUrl: fields[16] as String,
      type: fields[17] as String,
      userViewType: fields[18] as String,
      siteAdmin: fields[19] as bool,
      score: fields[20] as double,
      liked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GithubUser obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.liked)
      ..writeByte(4)
      ..write(obj.nodeId)
      ..writeByte(5)
      ..write(obj.gravatarId)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.htmlUrl)
      ..writeByte(8)
      ..write(obj.followersUrl)
      ..writeByte(9)
      ..write(obj.followingUrl)
      ..writeByte(10)
      ..write(obj.gistsUrl)
      ..writeByte(11)
      ..write(obj.starredUrl)
      ..writeByte(12)
      ..write(obj.subscriptionsUrl)
      ..writeByte(13)
      ..write(obj.organizationsUrl)
      ..writeByte(14)
      ..write(obj.reposUrl)
      ..writeByte(15)
      ..write(obj.eventsUrl)
      ..writeByte(16)
      ..write(obj.receivedEventsUrl)
      ..writeByte(17)
      ..write(obj.type)
      ..writeByte(18)
      ..write(obj.userViewType)
      ..writeByte(19)
      ..write(obj.siteAdmin)
      ..writeByte(20)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
