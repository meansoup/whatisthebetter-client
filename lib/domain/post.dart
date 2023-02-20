import 'package:client/domain/content.dart';

class PostData {
  final String id;
  final String ownerUsername;
  final String title;
  final String viewCount;
  final ContentData content1;
  final ContentData content2;
  final String createdAgo;

  const PostData({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.viewCount,
    required this.content1,
    required this.content2,
    required this.createdAgo,
  });
}