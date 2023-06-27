import 'package:client/config/theme.dart';
import 'package:client/domain/likerate.dart';
import 'package:client/domain/post.dart';
import 'package:client/presentation/widget/appbar/appbar.dart';
import 'package:client/presentation/widget/content/content.dart';
import 'package:client/presentation/widget/content/contents.dart';
import 'package:client/presentation/widget/likeratechart/like_rate_pie_chart.dart';
import 'package:client/service/like_rate/like_rate.dart';
import 'package:client/service/post.dart';
import 'package:flutter/gestures.dart';
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
  LikeRates? likeRates = null;

  @override
  void initState() {
    super.initState();
    futurePost = getPostWithTokenIfLoggedIn(widget.postId);
    controller = PageController(
      initialPage: 0,
    );
  }

  void loadCountryLikeRate() {
    setState(() {
      countryLikeRateWithTokenIfLoggedIn(widget.postId).then((value) => this.likeRates = value);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: mainTheme,
      darkTheme: mainDarkTheme,
      scrollBehavior: AppScrollBehavior(),
      home: Scaffold(
        appBar: WitbAppbar(),
        body: Center(
          child: FutureBuilder<PostData>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Card(
                  margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              child: ListTile(
                                title: Text(
                                  snapshot.data!.title,
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text("viewCount " + snapshot.data!.viewCount),
                              ),
                            )
                          )
                          ,
                          Text(snapshot.data!.ownerUsername)
                        ],
                      ),
                      ElevatedButton(
                        onPressed: loadCountryLikeRate,
                        child: Text('country rate'),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 500,
                          child: Contents(
                            contents: [
                              Content(contentData: snapshot.data!.content1),
                              Content(contentData: snapshot.data!.content2),
                            ],
                          )
                        )
                      ),
                      Container(
                        child: likeRates == null ? Container() : SizedBox(
                          height: 200,
                          child: LikeRatePieChartWidget(likeRates: likeRates!),
                        ),
                      ),
                    ],
                  ),
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

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}