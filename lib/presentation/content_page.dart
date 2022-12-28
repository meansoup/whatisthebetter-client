import 'package:client/domain/content.dart';
import 'package:client/presentation/content/content.dart';
import 'package:flutter/material.dart';


class ContentTempPage extends StatefulWidget {
  const ContentTempPage({super.key});

  @override
  State<ContentTempPage> createState() => ContentTempPageState();
}

class ContentTempPageState extends State<ContentTempPage> {

  @override
  Widget build(BuildContext context) {

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

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Content Example'),
          ),
          body: ListView(
            children: [
              Content(contentData: ContentData(postId: 'postId', contentId: 'content1 id', title: 'content1 title!!', text: tempBody, likeCnt: '5091'))
            ],
          ),
        )
    );
  }

}