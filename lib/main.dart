import 'package:client/presentation/content_page.dart';
import 'package:client/presentation/createpost.dart';
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
        '/content': (context) => const ContentTempPage(),
        '/post/create': (context) => const CreatePost(),
        '/join': (context) => const Join(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/post')) {
          List<String> tokens = settings.name!.split('/post/');
          var postId = tokens.elementAt(1);
          return MaterialPageRoute(
            builder: (context) {
              return GetPost(postId: postId,);
            }
          );
        }
      }
    );
  }

}