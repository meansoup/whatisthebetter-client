import 'package:client/domain/content.dart';

class PostData {
  final String id;
  final String ownerUsername;
  final String title;
  final ContentData content1;
  final ContentData content2;
  final int createdAt;
  final int modifiedAt;

  const PostData({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.content1,
    required this.content2,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      id: json['id'],
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      content1: ContentData(
        id: json['content1Id'],
        title: json['content1Title'],
        text: json['content1Text'],
        likeCnt: json['content1LikeCnt'],
      ),
      content2: ContentData(
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