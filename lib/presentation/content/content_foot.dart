import 'package:client/presentation/content/content_like_button.dart';
import 'package:flutter/material.dart';

class ContentFoot extends StatefulWidget {
  final String likeCnt;
  final bool liked;

  const ContentFoot({ Key? key, required this.likeCnt, required this.liked }): super(key: key);

  @override
  State<ContentFoot> createState() => ContentFootState();
}

class ContentFootState extends State<ContentFoot> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContentLikeButton(
            selected: selected,
            onPressed: () {
              setState(() {
                selected = !selected;
              });
            },
            likeCnt: widget.likeCnt,
          ),
          _buildButtonColumn(color, Icons.messenger_outline, 'comment'),
        ],
      )
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}