import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  final String commentId;
  final String commentOwner;
  final String commentText;
  final String createdAgo;

  const CommentWidget({
    Key? key,
    required this.commentId,
    required this.commentOwner,
    required this.commentText,
    required this.createdAgo,
  }): super(key: key);

  @override
  State<CommentWidget> createState() => CommentWidgetState();
}

class CommentWidgetState extends State<CommentWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: ListTile(
        title: Row(
          children: [
            Text(widget.commentOwner),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(widget.createdAgo),
            )
          ],
        ),
        subtitle: Text(widget.commentText),
      ),
    );
  }
}