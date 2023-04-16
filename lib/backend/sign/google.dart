import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// https://github.com/flutter/flutter/issues/88084
// https://github.com/flutter/plugins/blob/main/packages/google_sign_in/google_sign_in/example/lib/main.dart
// 이슈 https://github.com/flutter/flutter/issues/121211
// 이슈 어게인 https://github.com/flutter/flutter/issues/123168
// 이슈 https://stackoverflow.com/questions/75538252/i-have-bug-with-google-signin-google-sign-in-web-0-11-0-google-sign-in-6-0-0
// 레딧 https://www.reddit.com/r/flutterhelp/comments/11g4agh/help_me_to_use_google_sign_in/

// https://console.cloud.google.com/apis/dashboard?authuser=2&project=whatisthebetter

// 혹시 이건가?
// https://developers.google.com/identity/protocols/oauth2/web-server?hl=ko#httprest_1

// 깊이 봐보기
// https://pub.dev/packages/google_sign_in_web#migrating-to-v011-google-identity-services

GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/userinfo.profile"
    ]
);

void signInSilently() {
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    print('signInsilently log!!');

    print(account);
    if (account != null) {
      print("signInSilently - account not null");
      var snapshot = account.authentication;
      print(snapshot);

      _handleGetContact(account!);
    }
  });

  _googleSignIn.signInSilently();
}

Future<void> _handleGetContact(GoogleSignInAccount user) async {
  final http.Response response = await http.get(
    Uri.parse('https://people.googleapis.com/v1/people/me/connections?requestMask.includeField=person.names'),
    headers: await user.authHeaders,
  );
  if (response.statusCode != 200) {
    print('People API ${response.statusCode} response: ${response.body}');
    return;
  }
  final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
  final String? named = _pickFirstNamedContact(data);
  print('People API data!!');
  print(data);
  print(named);
}

String? _pickFirstNamedContact(Map<String, dynamic> data) {
  final List<dynamic>? connections = data['connections'] as List<dynamic>?;
  final Map<String, dynamic>? contact = connections?.firstWhere(
        (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
    orElse: () => null,
  ) as Map<String, dynamic>?;
  if (contact != null) {
    final List<dynamic> names = contact['names'] as List<dynamic>;
    final Map<String, dynamic>? name = names.firstWhere(
          (dynamic name) =>
      (name as Map<Object?, dynamic>)['displayName'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (name != null) {
      return name['displayName'] as String?;
    }
  }
  return null;
}

Future<void> signIn() async {
  signInSilently();
  var googleSignInAccount = await _googleSignIn.signIn();
  print('signIn log!!');
  print(googleSignInAccount);

  if (googleSignInAccount != null) {
    print("signIn - account not null");
    var snapshot = await googleSignInAccount.authentication;
    print(snapshot.toString());
    print(snapshot.accessToken);
    print(snapshot.idToken);
    print("signIn - snapshot printed");
  }
}

Future<String> signInGoogle() async {
  signInSilently();
  _googleSignIn.signIn().then((result){
    result?.authentication.then((googleKey){
      print(googleKey.accessToken);
      print(googleKey.idToken);
    }).catchError((err){
      print('inner error');
    });
  }).catchError((err){
    print('error occured');
  });

  return "";
}

Future<void> signOutGoogle() async {
  await GoogleSignIn(
    clientId: '945034348783-i72l5ioka25q7al01fe79ve1rjqenuk6.apps.googleusercontent.com'
  ).signOut();
}