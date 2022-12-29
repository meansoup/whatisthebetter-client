import 'package:client/presentation/content_page.dart';
import 'package:client/presentation/home.dart';
import 'package:client/presentation/join.dart';
import 'package:client/presentation/post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/post': (context) => const GetPost(),
        '/content': (context) => const ContentTempPage(),
        '/join': (context) => const Join(),
      },
    );
  }

}