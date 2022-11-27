import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Post Example'),
          ),
          body: Container(),
        )
    );
  }

}