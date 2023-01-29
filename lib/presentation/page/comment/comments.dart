import 'package:client/config/theme.dart';
import 'package:client/presentation/widget/appbar/appbar.dart';
import 'package:client/presentation/widget/comment/comment.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final String postId;
  final String contentId;

  const CommentsPage({
    super.key,
    required this.postId,
    required this.contentId,
  });

  @override
  State<CommentsPage> createState() => CommentsPageState();
}

class CommentsPageState extends State<CommentsPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
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
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                CommentWidget(
                  commentId: "123",
                  commentOwner: "meansoup",
                  commentText: "ListTile must be wrapped in a Material widget to animate tileColor, selectedTileColor, focusColor, and hoverColor as these colors are not drawn by the list tile itself but by the material widget ancestor.",
                  createdAgo: "7 Hour Ago",
                ),
                CommentWidget(
                  commentId: "456",
                  commentOwner: "meansoup",
                  commentText: "Specifying an itemExtent or an prototypeItem is more efficient than letting the children determine their own extent because the scrolling machinery can make use of the foreknowledge of the children's extent to save work, for example when the scroll position changes drastically.",
                  createdAgo: "4 Hour Ago",
                ),
              ],
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