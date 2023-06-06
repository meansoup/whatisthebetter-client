import 'package:client/backend/sign/google.dart';
import 'package:client/backend/witb-server/login.dart';
import 'package:client/service/service_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithGoogle {
  GoogleSignIn googleSignIn = generateGoogleSignIn();

  Future<void> readyToSignIn() async {
    googleSignIn.signInSilently();
  }
}

Future<String> loginIfNotLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();

  var loggedInToken = prefs.getString('witbToken') ?? "";

  if (loggedInToken.isNotEmpty) {
    return loggedInToken;
  }

  var googleSignIn = await signInGoogle();
  var authentication = await googleSignIn.currentUser?.authentication;
  var idToken = authentication?.idToken;
  print("google id token: $idToken");

  var witbToken = await login(LoginRequest(idToken: idToken!, social: "GOOGLE"));
  prefs.setString('witbToken', witbToken);
  return witbToken;
}

Future<String?> getTokenIfLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('witbToken');
}

Future<String> getTokenThrowErrorIfNotLoggedIn() async {
  final witbToken = await getTokenIfLoggedIn();

  if (witbToken == null) {
    throw NotLoggedInException();
  }

  return witbToken;
}