import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<CreateCommentResponse> createComment(String witbToken, CreateCommentRequest request) async {
  var requestBody = jsonEncode(request);
  print(requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post'),
    headers: {
      'witbToken': witbToken,
      "content-type" : "application/json",
      "accept" : "application/json",
    },
    body: jsonEncode(request),

  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 201) {
    var createCommentResponse = CreateCommentResponse.fromJson(jsonDecode(response.body));
    return createCommentResponse;
  } else {
    throw new Exception('Fail to create comment');
  }
}

class CreateCommentRequest {
  final String postId;
  final String contentId;
  final String text;

  const CreateCommentRequest({
    required this.postId,
    required this.contentId,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'contentId': contentId,
      'text': text,
    };
  }
}


class CreateCommentResponse {
  final String commentId;
  final int createdAt;

  const CreateCommentResponse({
    required this.commentId,
    required this.createdAt,
  });

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) {
    return CreateCommentResponse(commentId: json['commentId'], createdAt: json['createdAt']);
  }
}