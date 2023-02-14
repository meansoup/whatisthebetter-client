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
    var commentsResponse = parseComments(jsonDecode(response.body));
    var comments = commentsResponse.map((c) => c.toComment()).toList();

    return comments;
  } else {
    throw Exception('Failed to load comment');
  }
}

String listCommentsUrl(String postId, String contentId, String? listingPoint) {
  if (listingPoint != null) {
    return 'https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/comment/lists?postId=' + postId + '&contentId=' + contentId + '&listingPoint=' + listingPoint;
  }
  return 'https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/comment/lists?postId=' + postId + '&contentId=' + contentId;
}

class CommentResponse {
  final String commentId;
  final String uid;
  final String text;
  final int createdAt;

  const CommentResponse({
    required this.commentId,
    required this.uid,
    required this.text,
    required this.createdAt,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
        commentId: json['commentId'],
        uid: json['uid'],
        text: json['text'],
        createdAt: json['createdAt'],
    );
  }

  Comment toComment() {
    return Comment(commentId: commentId, uid: uid, text: text, createdAt: createdAt);
  }
}

List<CommentResponse> parseComments(List<dynamic> jsonList) {
  return jsonList.map((json) => CommentResponse.fromJson(json)).toList();
}