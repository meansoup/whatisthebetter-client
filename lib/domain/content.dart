class Content {
  final String id;
  final String title;
  final String text;
  final String likeCnt;

  const Content({
    required this.id,
    required this.title,
    required this.text,
    required this.likeCnt,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      likeCnt: json['likeCnt'],
    );
  }
}