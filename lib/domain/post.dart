import 'package:client/domain/content.dart';

class Post {
  final String id;
  final String ownerUsername;
  final String title;
  final Content content1;
  final Content content2;
  final int createdAt;
  final int modifiedAt;

  const Post({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.content1,
    required this.content2,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      content1: Content(
        id: json['content1Id'],
        title: json['content1Title'],
        text: json['content1Text'],
        likeCnt: json['content1LikeCnt'],
      ),
      content2: Content(
        id: json['content2Id'],
        title: json['content2Title'],
        text: json['content2Text'],
        likeCnt: json['content2LikeCnt'],
      ),
      createdAt: json['createdAt'],
      modifiedAt: json['modifiedAt'],
    );
  }
}