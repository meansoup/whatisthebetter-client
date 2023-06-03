import 'dart:async';
import 'dart:convert';

import 'package:client/backend/witb-server/error_response.dart';
import 'package:client/backend/witb-server/exception.dart';
import 'package:http/http.dart' as http;

Future<String> join(JoinRequest JoinRequest) async {
  var requestBody = jsonEncode(JoinRequest);
  print("witb login responseBody:" + requestBody);

  final response = await http.post(
    Uri.parse('https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com/v1/login'),
    body: jsonEncode(JoinRequest),
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
    }
  );

  if (response.statusCode == 200) {
    var joinResponse = JoinResponse.fromJson(jsonDecode(response.body));
    print('witbToken = ${joinResponse.witbToken}');
    return joinResponse.witbToken;
  } else {
    print('witb login error:' + response.body);
    if (response.statusCode == 409) {
      var errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
      if (errorResponse.isUserAlreadyExist()) {
        throw UserAlreadyExistException();
      }
    }
  }
  return "";
}

class JoinRequest {
  final String idToken;
  final String name;
  final String email;
  final String countryCode;
  final String sex;
  final JoinBirthDateRequest birthDate;
  final String social;

  const JoinRequest({
    required this.idToken,
    required this.name,
    required this.email,
    required this.countryCode,
    required this.sex,
    required this.birthDate,
    required this.social,
  });

  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'name': name,
      'email': email,
      'countryCode': countryCode,
      'sex': sex,
      'birthDate': birthDate,
      'social': social,
    };
  }

  factory JoinRequest.fromJson(Map<String, dynamic> json) {
    return JoinRequest(
      idToken: json['idToken'],
      name: json['name'],
      email: json['email'],
      countryCode: json['countryCode'],
      sex: json['sex'],
      birthDate: json['birthDate'],
      social: json['social'],
    );
  }
}

class JoinBirthDateRequest {
  final int year;
  final int month;
  final int day;

  const JoinBirthDateRequest({
    required this.year,
    required this.month,
    required this.day,
  });

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'day': day,
    };
  }

  factory JoinBirthDateRequest.fromJson(Map<String, dynamic> json) {
    return JoinBirthDateRequest(
      year: json['year'],
      month: json['month'],
      day: json['day'],
    );
  }
}

class JoinResponse {
  final String witbToken;

  const JoinResponse({
    required this.witbToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'witbToken': witbToken,
    };
  }

  factory JoinResponse.fromJson(Map<String, dynamic> json) {
    return JoinResponse(
      witbToken: json['witbToken'],
    );
  }
}