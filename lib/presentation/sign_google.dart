import 'package:client/data/sign/google.dart';
import 'package:client/data/witb-server/login.dart';
import 'package:flutter/material.dart';

class SignGoogle extends StatefulWidget {
  const SignGoogle({Key? key}) : super(key: key);

  @override
  State<SignGoogle> createState() => _SignGoogleState();
}

class _SignGoogleState extends State<SignGoogle> {
  String idToken = "";

  void signInWithGoogle() async {
    await signInGoogle().then((value) => {
      setState(() {
        idToken = value;
      })
    });

    print("google id token: $idToken");
    login(LoginRequest(idToken: idToken, social: "GOOGLE"));
  }

  void signOut() async {
    if (idToken.isNotEmpty) {
      signOutGoogle();
      idToken = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: idToken.isNotEmpty? _logoutButton():
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