import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> createPost(String witbToken, CreatePostRequest createPostRequest) async {
  var requestBody = jsonEncode(createPostRequest);
  print(requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post'),
    headers: {
      'witbToken': witbToken,
      "content-type" : "application/json",
      "accept" : "application/json",
    },
    body: jsonEncode(createPostRequest),

  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    var createPostResponse = CreatePostResponse.fromJson(jsonDecode(response.body));
    return createPostResponse.postId;
  } else {
    return "";
  }
}

class CreatePostRequest {
  final String title;
  final CreatePostContentRequest content1;
  final CreatePostContentRequest content2;

  const CreatePostRequest({
    required this.title,
    required this.content1,
    required this.content2,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content1': content1,
      'content2': content2,
    };
  }
}

class CreatePostContentRequest {
  final String title;
  final String text;

  const CreatePostContentRequest({
    required this.title,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': text,
    };
  }
}

class CreatePostResponse {
  final String postId;
  final String title;

  const CreatePostResponse({
    required this.postId,
    required this.title,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) {
    return CreatePostResponse(postId: json['postId'], title: json['title']);
  }
}