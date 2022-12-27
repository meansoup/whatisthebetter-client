import 'package:client/data/witb-server/getpost.dart';
import 'package:client/domain/post.dart';
import 'package:flutter/material.dart';


class GetPost extends StatefulWidget {
  const GetPost({super.key});

  @override
  State<GetPost> createState() => PostState();
}

class PostState extends State<GetPost> {
  late Future<PostData> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = getPost("postId");
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('GetPost Example'),
          ),
          body: Center(
            child: FutureBuilder<PostData>(
              future: futurePost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.id);
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