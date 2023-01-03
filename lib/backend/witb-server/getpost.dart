import 'dart:async';
import 'dart:convert';

import 'package:client/domain/content.dart';
import 'package:client/domain/post.dart';
import 'package:http/http.dart' as http;

Future<PostData> getPost(String? witbToken, String postId) async {

  Map<String, String> headers = {};
  if (witbToken != null) {
    headers = {
      'witbToken': witbToken,
    };
  }

  final response = await http.get(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post?postId=' + postId),
    headers: headers
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    var getPostResponse = GetPostResponse.fromJson(jsonDecode(response.body));
    return getPostResponse.toPostData();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GetPostResponse {
  final String id;
  final String ownerUsername;
  final String title;
  final GetPostContentResponse content1;
  final GetPostContentResponse content2;
  final int createdAt;
  final int modifiedAt;
  final String? likedContentId;

  const GetPostResponse({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.content1,
    required this.content2,
    required this.createdAt,
    required this.modifiedAt,
    this.likedContentId,
  });

  factory GetPostResponse.fromJson(Map<String, dynamic> json) {
    var postId = json['id'];
    return GetPostResponse(
      id: postId,
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      content1: GetPostContentResponse(
        postId: postId,
        contentId: json['content1Id'],
        title: json['content1Title'],
        text: json['content1Text'],
        likeCnt: json['content1LikeCnt'],
      ),
      content2: GetPostContentResponse(
        postId: postId,
        contentId: json['content2Id'],
        title: json['content2Title'],
        text: json['content2Text'],
        likeCnt: json['content2LikeCnt'],
      ),
      createdAt: json['createdAt'],
      modifiedAt: json['modifiedAt'],
      likedContentId: json['likedContentId'],
    );
  }

  PostData toPostData() {
    return PostData(
      id: id,
      ownerUsername: ownerUsername,
      title: title,
      content1: ContentData(
        postId: id,
        contentId: content1.contentId,
        title: content1.title,
        text: content1.text,
        likeCnt: content1.likeCnt,
      ),
      content2: ContentData(
        postId: id,
        contentId: content2.contentId,
        title: content2.title,
        text: content2.text,
        likeCnt: content2.likeCnt,
      ),
      createdAt: createdAt,
      modifiedAt: modifiedAt,
    );
  }
}

class GetPostContentResponse {
  final String postId;
  final String contentId;
  final String title;
  final String text;
  final String likeCnt;

  const GetPostContentResponse({
    required this.postId,
    required this.contentId,
    required this.title,
    required this.text,
    required this.likeCnt,
  });
}