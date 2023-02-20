import 'package:client/presentation/widget/comment/comment.dart';
import 'package:client/service/comment.dart';
import 'package:flutter/material.dart';

class LeaveCommentWidget extends StatefulWidget {

  final String postId;
  final String contentId;
  final List comments;
  final Function(CommentWidget) addComments;

  const LeaveCommentWidget({
    super.key,
    required this.postId,
    required this.contentId,
    required this.comments,
    required this.addComments,
  });

  @override
  State<LeaveCommentWidget> createState() => LeaveCommentWidgetState();
}

class LeaveCommentWidgetState extends State<LeaveCommentWidget> {

  @override
  Widget build(BuildContext context) {
    final leaveCommentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            controller: leaveCommentController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'leave comment',
                hintText: 'Enter your comment'
            ),
          ),
          TextButton(
            onPressed: () {
              createCommentWithCheckLogin(widget.postId, widget.contentId, leaveCommentController.text).then((comment) {
                print('created comment Id:' + comment.commentId);
                var commentWidget = CommentWidget(
                  commentId: comment.commentId,
                  commentOwner: comment.uid,
                  commentText: comment.text,
                  createdAgo: comment.createdAgo.toString(),
                );
                widget.addComments(commentWidget);
              });
            },
            child: Text("textButton"),
          )
        ],
      ),
    );
  }
}