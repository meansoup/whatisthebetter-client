import 'package:client/presentation/widget/content/content_comment_button.dart';
import 'package:flutter/material.dart';

import 'content_like_button.dart';

class ContentFoot extends StatefulWidget {
  final String postId;
  final String contentId;
  final String likeCnt;
  final bool liked;

  const ContentFoot({
    Key? key,
    required this.postId,
    required this.contentId,
    required this.likeCnt,
    required this.liked
  }): super(key: key);

  @override
  State<ContentFoot> createState() => ContentFootState();
}

class ContentFootState extends State<ContentFoot> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.liked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContentLikeButton(
            selected: selected,
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            postId: widget.postId,
            contentId: widget.contentId,
            likeCnt: widget.likeCnt,
          ),
          ContentCommentButton(
            postId: widget.postId,
            contentId: widget.contentId,
          ),
        ],
      )
    );
  }
}