import 'package:flutter/material.dart';

class ContentBody extends StatefulWidget {
  final String bodyText;

  const ContentBody({ Key? key, required this.bodyText }): super(key: key);

  @override
  State<ContentBody> createState() => ContentBodyState();
}

class ContentBodyState extends State<ContentBody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBodyColumn(widget.bodyText)
        ],
      )
    );
  }

  Column _buildBodyColumn(String title) {
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