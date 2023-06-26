
import 'package:client/backend/witb-server/like_rate/country_like_rate.dart';
import 'package:client/domain/likerate.dart';
import 'package:client/service/login.dart';

Future<LikeRates> countryLikeRateWithTokenIfLoggedIn(postId) async {
  var witbToken = await getTokenThrowErrorIfNotLoggedIn();
  return countryLikeRate(witbToken, postId);
}