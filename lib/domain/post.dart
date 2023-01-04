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
}