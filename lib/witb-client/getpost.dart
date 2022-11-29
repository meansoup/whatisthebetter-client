import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Post> getPost(String postId) async {
  final response = await http
      .get(Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post?postId=' + postId));

  // https://flutterawesome.com/
  // FLUTER 뷰 참고 페이지

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Post {
  final String id;
  final String ownerUsername;
  final String title;
  final String content1Id;
  final String content1Title;
  final String content1Text;
  final String content1LikeCnt;
  final String content2Id;
  final String content2Title;
  final String content2Text;
  final String content2LikeCnt;
  final int createdAt;
  final int modifiedAt;

  const Post({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.content1Id,
    required this.content1Title,
    required this.content1Text,
    required this.content1LikeCnt,
    required this.content2Id,
    required this.content2Title,
    required this.content2Text,
    required this.content2LikeCnt,
    required this.createdAt,
    required this.modifiedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      content1Id: json['content1Id'],
      content1Title: json['content1Title'],
      content1Text: json['content1Text'],
      content1LikeCnt: json['content1LikeCnt'],
      content2Id: json['content2Id'],
      content2Title: json['content2Title'],
      content2Text: json['content2Text'],
      content2LikeCnt: json['content2LikeCnt'],
      createdAt: json['createdAt'],
      modifiedAt: json['modifiedAt'],
    );
  }
}