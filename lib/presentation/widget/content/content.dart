import 'package:client/domain/content.dart';
import 'package:flutter/material.dart';

import 'content_body.dart';
import 'content_foot.dart';
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
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContentHead(title: widget.contentData.title),
                ContentBody(bodyText: widget.contentData.text),
                ContentFoot(
                    postId: widget.contentData.postId,
                    contentId: widget.contentData.contentId,
                    likeCnt: widget.contentData.likeCnt,
                    liked: widget.contentData.liked
                )
              ],
            ),
          ),
        ),
    );
  }

}