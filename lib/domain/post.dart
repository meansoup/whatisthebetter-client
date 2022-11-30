class Post {
  final String id;
  final String ownerUsername;
  final String title;
  final String content1Id;
  final String content1Title;
  final String content1Text;
  final String content1LikeCnt;
  final String content2Id;
  final String content2Title;
  final String content2Text;
  final String content2LikeCnt;
  final int createdAt;
  final int modifiedAt;

  const Post({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.content1Id,
    required this.content1Title,
    required this.content1Text,
    required this.content1LikeCnt,
    required this.content2Id,
    required this.content2Title,
    required this.content2Text,
    required this.content2LikeCnt,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      content1Id: json['content1Id'],
      content1Title: json['content1Title'],
      content1Text: json['content1Text'],
      content1LikeCnt: json['content1LikeCnt'],
      content2Id: json['content2Id'],
      content2Title: json['content2Title'],
      content2Text: json['content2Text'],
      content2LikeCnt: json['content2LikeCnt'],
      createdAt: json['createdAt'],
      modifiedAt: json['modifiedAt'],
    );
  }
}