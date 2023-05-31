import 'dart:async';
import 'dart:convert';

import 'package:client/backend/witb-server/error_response.dart';
import 'package:client/backend/witb-server/exception.dart';
import 'package:http/http.dart' as http;

Future<String> login(LoginRequest loginRequest) async {
  var requestBody = jsonEncode(loginRequest);
  print("witb login responseBody:" + requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/login'),
    body: jsonEncode(loginRequest),
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
    }
  );

  if (response.statusCode == 200) {
    var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    print('witbToken = ${loginResponse.witbToken}');
    return loginResponse.witbToken;
  } else {
    print('witb login error:' + response.body);
    if (response.statusCode == 404) {
      var errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      if (errorResponse.isUserNotExist()) {
        throw UserNotExistException();
      }
    }
  }
  return "";
}

class LoginRequest {
  final String idToken;
  final String social;

  const LoginRequest({
    required this.idToken,
    required this.social,
  });

  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'social': social,
    };
  }
}

class LoginResponse {
  final String witbToken;

  const LoginResponse({
    required this.witbToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'witbToken': witbToken,
    };
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      witbToken: json['witbToken'],
    );
  }
}