class ContentData {
  final String id;
  final String title;
  final String text;
  final String likeCnt;

  const ContentData({
    required this.id,
    required this.title,
    required this.text,
    required this.likeCnt,
  });

  factory ContentData.fromJson(Map<String, dynamic> json) {
    return ContentData(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      likeCnt: json['likeCnt'],
    );
  }
}