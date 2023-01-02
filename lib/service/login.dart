import 'package:client/backend/sign/google.dart';
import 'package:client/backend/witb-server/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> loginIfNotLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();

  var loggedInToken = prefs.getString('witbToken') ?? "";

  if (loggedInToken.isNotEmpty) {
    return loggedInToken;
  }

  var idToken = await signInGoogle();
  print("google id token: $idToken");

  var witbToken = await login(LoginRequest(idToken: idToken, social: "GOOGLE"));
  prefs.setString('witbToken', witbToken);
  return witbToken;
}