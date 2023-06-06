import 'package:client/backend/sign/google.dart';
import 'package:client/service/service_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithGoogle {
  GoogleSignIn googleSignIn = generateGoogleSignIn();

  Future<void> readyToSignIn() async {
    googleSignIn.signInSilently();
  }
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