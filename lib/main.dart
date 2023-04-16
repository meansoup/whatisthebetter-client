import 'package:client/presentation/page/comment/comments.dart';
import 'package:client/presentation/page/home.dart';
import 'package:client/presentation/page/post/createpost.dart';
import 'package:client/presentation/page/post/getpost.dart';
import 'package:client/presentation/page/sign_google.dart';
import 'package:client/presentation/page/tempsign.dart';
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
        '/test': (context) => const SignInDemo(),
      },
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/post')) {
          // /post/{postId}/content/{contentId}/comment
          if (settings.name!.endsWith('/comment')) {
            List<String> tokens = settings.name!.split('/post/');
            var postId = tokens.elementAt(1).split('/').elementAt(1);

            tokens = settings.name!.split('/content/');
            var contentId = tokens.elementAt(1).split('/').elementAt(1);

            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return CommentsPage(postId: postId, contentId: contentId);
              }
            );
          }

          // /post/{postId}
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