import 'dart:async';
import 'dart:convert';

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
    return PostData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}