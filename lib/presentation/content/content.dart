import 'package:client/presentation/content/content_body.dart';
import 'package:client/presentation/content/content_foot.dart';
import 'package:flutter/material.dart';

import 'content_head.dart';

class Content extends StatefulWidget {
  const Content({super.key});

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
            ContentHead(),
            ContentBody(),
            ContentFoot()
          ],
        )
    );
  }

}