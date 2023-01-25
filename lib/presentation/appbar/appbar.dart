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
      title: const Text('GetPost Example'),
    );
  }

}