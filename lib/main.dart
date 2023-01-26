import 'package:client/presentation/page/home.dart';
import 'package:client/presentation/page/post/createpost.dart';
import 'package:client/presentation/page/post/getpost.dart';
import 'package:client/presentation/page/sign_google.dart';
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
        '/post/create': (context) => const CreatePost(),
        '/login': (contenxt) => const SignGoogle(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/post')) {
          List<String> tokens = settings.name!.split('/post/');
          var postId = tokens.elementAt(1);
          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return GetPost(postId: postId,);
            }
          );
        }
      }
    );
  }

}