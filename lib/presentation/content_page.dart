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

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Content Example'),
          ),
          body: ListView(
            children: [
              Content()
            ],
          ),
        )
    );
  }

}