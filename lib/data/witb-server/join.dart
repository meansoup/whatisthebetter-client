import 'dart:async';
import 'dart:convert';

import 'package:client/domain/post.dart';
import 'package:http/http.dart' as http;

Future<bool> join(JoinDto joinDto) async {
  var requestBody = jsonEncode(joinDto);
  print(requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/user'),
    body: jsonEncode(joinDto),
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
    }
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

class JoinDto {
  final String name;
  final String email;

  const JoinDto({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

