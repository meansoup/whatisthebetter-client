import 'dart:async';
import 'dart:convert';

import 'package:client/domain/comment.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<List<Comment>> listComments(String? witbToken, String postId, String contentId, String? listingPoint) async {
  var url = listCommentsUrl(postId, contentId, listingPoint);

  Response response;
  if (witbToken != null) {
    response = await http.get(
      Uri.parse(url),
      headers: {
        'witbToken': witbToken,
      },
    );
  } else {
    response = await http.get(
      Uri.parse(url),
    );
  }

  if (response.statusCode == 200) {
    print(response.body);
    var commentsResponse = CommentsResponse.fromJson(jsonDecode(response.body));
    var comments = commentsResponse.comments.map((c) => c.toComment()).toList();

    return comments;
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to load comment');
  }
}

String listCommentsUrl(String postId, String contentId, String? listingPoint) {
  if (listingPoint != null) {
    return 'https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post/' + postId + '/content/' + contentId + '/comments/&listingPoint=' + listingPoint;
  }
  return 'https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post/' + postId + '/content/' + contentId + '/comments';
}

class CommentsResponse {
  final List<CommentResponse> comments;
  final String listingPoint;

  const CommentsResponse({
    required this.comments,
    required this.listingPoint,
  });

  factory CommentsResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> comments = json['comments'];

    return CommentsResponse(
      comments: comments.map((json) => CommentResponse.fromJson(json)).toList(),
      listingPoint: json['listingPoint'],
    );
  }
}

class CommentResponse {
  final String commentId;
  final String uid;
  final String text;
  final String createdAgo;

  const CommentResponse({
    required this.commentId,
    required this.uid,
    required this.text,
    required this.createdAgo,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
        commentId: json['id'],
        uid: json['uid'],
        text: json['text'],
        createdAgo: json['createdAgo'],
    );
  }

  Comment toComment() {
    return Comment(commentId: commentId, uid: uid, text: text, createdAgo: createdAgo);
  }
}