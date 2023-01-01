import 'package:google_sign_in/google_sign_in.dart';

Future<String> signInGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com'
  ).signIn();

  if (googleUser != null) {
    print('name = ${googleUser.displayName}');
    print('email = ${googleUser.email}');

    var snapshot = await googleUser.authentication;
    return snapshot.idToken ?? "";
  }

  return "";
}

Future<void> signOutGoogle() async {
  await GoogleSignIn(
    clientId: '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com'
  ).signOut();
}