import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> createPost(String witbToken, CreatePostDto createPostDto) async {
  var requestBody = jsonEncode(createPostDto);
  print(requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post'),
    headers: {
      'witbToken': witbToken,
      "content-type" : "application/json",
      "accept" : "application/json",
    },
    body: jsonEncode(createPostDto),

  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

class CreatePostDto {
  final String title;
  final CreatePostContentDto content1;
  final CreatePostContentDto content2;

  const CreatePostDto({
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

class CreatePostContentDto {
  final String title;
  final String text;

  const CreatePostContentDto({
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