import 'package:client/domain/post.dart';
import 'package:client/presentation/appbar/appbar.dart';
import 'package:client/presentation/content/content.dart';
import 'package:client/service/post.dart';
import 'package:flutter/material.dart';


class GetPost extends StatefulWidget {
  final String postId;

  const GetPost({
    super.key,
    required this.postId,
  });

  @override
  State<GetPost> createState() => PostState();
}

class PostState extends State<GetPost> {
  late Future<PostData> futurePost;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    futurePost = getPostWithTokenIfLoggedIn(widget.postId);
    controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: WitbAppbar(),
          body: Center(
            child: FutureBuilder<PostData>(
              future: futurePost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView(
                    controller: controller,
                    children: <Widget>[
                      Center(
                        child: Content(contentData: snapshot.data!.content1),
                      ),
                      Center(
                        child: Content(contentData: snapshot.data!.content2)
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        )
    );
  }

}