import 'package:client/backend/witb-server/like_rate/country_like_rate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('countryLikeRate api call test without witbToken', () async {
    String postId = "postId";
    var response = await countryLikeRate(null, postId);
    print(response);
  });
}