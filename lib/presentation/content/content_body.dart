import 'package:flutter/material.dart';

class ContentBody extends StatefulWidget {
  const ContentBody({super.key});

  @override
  State<ContentBody> createState() => ContentBodyState();
}

class ContentBodyState extends State<ContentBody> {

  var tempBody = """
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
  """;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBodyColumn(tempBody)
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