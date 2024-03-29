import 'package:client/presentation/page/home.dart';
import 'package:client/presentation/page/post/createpost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WitbAppbar extends StatefulWidget implements PreferredSizeWidget {

  WitbAppbar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _WitbAppBarState createState() => _WitbAppBarState();

  @override
  final Size preferredSize;
}

class _WitbAppBarState extends State<WitbAppbar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()))
          },
          child: Text("WhatIsTheBetter"),
      ),
      // leading:
      // IconButton(icon: Icon(Icons.menu), onPressed: ()=> {print("menu")}),
      actions: [
        IconButton(
            icon: Icon(Icons.create),
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePost()))
            }
        ),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => {print("account info")}
        ),
      ],
    );
  }

}