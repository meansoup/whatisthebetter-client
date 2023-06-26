import 'dart:async';
import 'dart:convert';

import 'package:client/domain/likerate.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String baseUrl = 'https://06g3yu62c2.execute-api.ap-northeast-2.amazonaws.com';

Future<LikeRates> countryLikeRate(String? witbToken, String postId) async {
  Response response;
  if (witbToken != null) {
    response = await http.get(
        Uri.parse(baseUrl + '/v1/post/' + postId + '/like/country/KR'),
        headers: {
          'witbToken': witbToken,
        }
    );
  } else {
    response = await http.get(
      Uri.parse(baseUrl + '/v1/post/' + postId + '/like/country/KR'),
    );
  }

  if (response.statusCode == 200) {
    print(response.body);
    var countryLikeRateResponse = CountryLikeRateResponse.fromJson(jsonDecode(response.body));
    return countryLikeRateResponse.toEntity();
  } else {
    throw Exception('Failed to load album');
  }
}

class CountryLikeRateResponse {
  final String country;
  final Map<String, double> likeRate;

  const CountryLikeRateResponse({
    required this.country,
    required this.likeRate,
  });

  factory CountryLikeRateResponse.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> likeRateJson = json['likeRate'];
    Map<String, double> parsedLikeRate = {};

    likeRateJson.forEach((key, value) {
      parsedLikeRate[key] = value.toDouble();
    });

    return CountryLikeRateResponse(
      country: json['country'],
      likeRate: parsedLikeRate,
    );
  }

  LikeRates toEntity() {
    List<LikeRate> likeRateList = [];
    likeRate.forEach((key, value) {
      likeRateList.add(LikeRate(key, value));
    });
    return LikeRates(likeRateList);
  }
}