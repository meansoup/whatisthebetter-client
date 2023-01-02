import 'dart:async';
import 'dart:convert';

import 'package:client/domain/post.dart';
import 'package:http/http.dart' as http;

Future<bool> createPost(CreatePostDto createPostDto) async {
  var requestBody = jsonEncode(createPostDto);
  print(requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post'),
    headers: {
      // TODO: uid 고정 해제하기
      'uid': 'fd35e3e5-01d3-4d26-ae23-c86622bfe34c',
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