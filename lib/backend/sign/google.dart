import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

const String googleClientId = '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn generateGoogleSignIn() {
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: googleClientId,
    scopes: scopes,
  );

  return googleSignIn;
}

Future<GoogleSignIn> signInGoogle() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: googleClientId,
    scopes: scopes,
  );

  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
    var googleSignInAuthentication = await account?.authentication;
    var idToken = googleSignInAuthentication?.idToken;
  });

  _googleSignIn.signInSilently();

  return _googleSignIn;
}

Future<void> signOutGoogle() async {
  await GoogleSignIn(
    clientId: '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com'
  ).signOut();
}