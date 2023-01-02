import 'dart:async';

import 'package:http/http.dart' as http;

Future<bool> likeContent(String postId, String contentId) async {
  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/post/' + postId + '/content/' + contentId + '/like'),
    headers: {
      'uid': 'uid',
    },
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}