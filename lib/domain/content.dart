class ContentData {
  final String postId;
  final String contentId;
  final String title;
  final String text;
  final String likeCnt;
  final bool liked;

  const ContentData({
    required this.postId,
    required this.contentId,
    required this.title,
    required this.text,
    required this.likeCnt,
    required this.liked,
  });
}