import 'package:client/presentation/page/comment/comments.dart';
import 'package:flutter/material.dart';

class ContentCommentButton extends StatefulWidget {
  const ContentCommentButton({
    super.key,
    required this.postId,
    required this.contentId,
  });

  final String postId;
  final String contentId;

  @override
  State<ContentCommentButton> createState() => _ContentCommentButtonState();
}

class _ContentCommentButtonState extends State<ContentCommentButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentsPage(postId: widget.postId, contentId: widget.contentId)),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.messenger_outline),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "comments",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}