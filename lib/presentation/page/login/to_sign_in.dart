
import 'package:client/presentation/page/login/sign_in_google.dart';
import 'package:client/service/login.dart';
import 'package:flutter/material.dart';

Future<void> loginIfNotLoggedIn(BuildContext context) async {
  var loggedInToken = await getTokenIfLoggedIn();

  if (loggedInToken == null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInGoogle()),
    );
  }
}
