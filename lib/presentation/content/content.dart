import 'package:client/domain/content.dart';
import 'package:client/presentation/content/content_body.dart';
import 'package:client/presentation/content/content_foot.dart';
import 'package:flutter/material.dart';

import 'content_head.dart';

class Content extends StatefulWidget {
  final ContentData contentData;

  const Content({ Key? key, required this.contentData }): super(key: key);

  @override
  State<Content> createState() => ContentState();
}

class ContentState extends State<Content> {

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContentHead(title: widget.contentData.title),
            ContentBody(bodyText: widget.contentData.text),
            ContentFoot(
                postId: widget.contentData.postId,
                contentId: widget.contentData.contentId,
                likeCnt: widget.contentData.likeCnt,
                liked: false
            )
          ],
        )
    );
  }

}