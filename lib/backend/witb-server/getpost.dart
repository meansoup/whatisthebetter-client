import 'dart:async';
import 'dart:convert';

import 'package:client/domain/content.dart';
import 'package:client/domain/post.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<PostData> getPost(String? witbToken, String postId) async {
  Response response;
  if (witbToken != null) {
    response = await http.get(
        Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post?postId=' + postId),
        headers: {
          'witbToken': witbToken,
        }
    );
  } else {
    response = await http.get(
        Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post?postId=' + postId),
    );
  }

  if (response.statusCode == 200) {
    print(response.body);
    var getPostResponse = GetPostResponse.fromJson(jsonDecode(response.body));
    return getPostResponse.toPostData();
  } else {
    throw Exception('Failed to load album');
  }
}

class GetPostResponse {
  final String id;
  final String ownerUsername;
  final String title;
  final String viewCount;
  final GetPostContentResponse content1;
  final GetPostContentResponse content2;
  final String createdAgo;
  final String? likedContentId;

  const GetPostResponse({
    required this.id,
    required this.ownerUsername,
    required this.title,
    required this.viewCount,
    required this.content1,
    required this.content2,
    required this.createdAgo,
    this.likedContentId,
  });

  factory GetPostResponse.fromJson(Map<String, dynamic> json) {
    var postId = json['id'];
    return GetPostResponse(
      id: postId,
      ownerUsername: json['ownerUsername'],
      title: json['title'],
      viewCount: json['viewCount'],
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
      createdAgo: json['createdAgo'],
      likedContentId: json['likedContentId'],
    );
  }

  PostData toPostData() {
    return PostData(
      id: id,
      ownerUsername: ownerUsername,
      title: title,
      viewCount: viewCount,
      content1: ContentData(
        postId: id,
        contentId: content1.contentId,
        title: content1.title,
        text: content1.text,
        likeCnt: content1.likeCnt,
        liked: likedContentId == content1.contentId,
      ),
      content2: ContentData(
        postId: id,
        contentId: content2.contentId,
        title: content2.title,
        text: content2.text,
        likeCnt: content2.likeCnt,
        liked: likedContentId == content2.contentId,
      ),
      createdAgo: createdAgo,
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