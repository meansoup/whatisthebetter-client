import 'package:client/presentation/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: WitbAppbar(),
          body: Container(),
        )
    );
  }

}