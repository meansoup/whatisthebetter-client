import 'package:client/backend/sign/google.dart';
import 'package:client/service/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignGoogle extends StatefulWidget {
  const SignGoogle({Key? key}) : super(key: key);

  @override
  State<SignGoogle> createState() => _SignGoogleState();
}

class _SignGoogleState extends State<SignGoogle> {
  String witbToken = "";

  void signInWithGoogle() async {
    await loginIfNotLoggedIn();

    final prefs = await SharedPreferences.getInstance();
    witbToken = prefs.getString('witbToken') ?? "";

    print("witb token: $witbToken");
  }

  void signOut() async {
    if (witbToken.isNotEmpty) {
      signOutGoogle();
      witbToken = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: witbToken.isNotEmpty? _logoutButton():
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginButton(
                  signInWithGoogle,
                )
              ],
            )
      ),
    );
  }

  Widget _loginButton(VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('asset/image/google.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff00ff00),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}