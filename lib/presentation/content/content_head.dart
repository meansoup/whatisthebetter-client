import 'package:flutter/material.dart';

class ContentHead extends StatefulWidget {
  const ContentHead({super.key});

  @override
  State<ContentHead> createState() => ContentHeadState();
}

class ContentHeadState extends State<ContentHead> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTitleColumn("content1 title!!")
        ],
      )
    );
  }

  Column _buildTitleColumn(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Text(title)
        )
      ],
    );
  }

}