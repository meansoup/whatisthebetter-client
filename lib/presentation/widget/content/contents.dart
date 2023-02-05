import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/presentation/widget/content/content.dart';
import 'package:flutter/material.dart';

class Contents extends StatefulWidget {
  final List<Content> contents;

  const Contents({
    Key? key,
    required this.contents,
  }): super(key: key);

  @override
  State<Contents> createState() => ContentsState();
}

class ContentsState extends State<Contents> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 1,
        ),
        items: widget.contents,
      )
    );
  }
}