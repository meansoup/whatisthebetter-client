
import 'package:client/presentation/page/login/sign_in_google.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginIfNotLoggedIn(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  var loggedInToken = prefs.getString('witbToken') ?? "";

  if (loggedInToken.isNotEmpty) {
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignInGoogle()),
  );
}