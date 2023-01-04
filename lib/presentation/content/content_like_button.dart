import 'package:client/service/post.dart';
import 'package:flutter/material.dart';

class ContentLikeButton extends StatefulWidget {
  const ContentLikeButton({
    super.key,
    required this.selected,
    required this.onPressed,
    required this.postId,
    required this.contentId,
    required this.likeCnt
  });

  final bool selected;
  final VoidCallback? onPressed;
  final String postId;
  final String contentId;
  final String likeCnt;

  @override
  State<ContentLikeButton> createState() => _ContentLikeButtonState();
}

class _ContentLikeButtonState extends State<ContentLikeButton> {
  late final MaterialStatesController statesController;

  @override
  void initState() {
    super.initState();
    statesController = MaterialStatesController(
        <MaterialState>{if (widget.selected) MaterialState.selected});
  }

  @override
  void didUpdateWidget(ContentLikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      if (widget.selected) {
        likeContentWithCheckLogin(widget.postId, widget.contentId).then((success) => {
          if (success) {
            statesController.update(MaterialState.selected, widget.selected)
          } else {
            statesController.update(MaterialState.selected, false)
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      statesController: statesController,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red;
            }
            if (states.contains(MaterialState.hovered)) {
              return Colors.pink.shade50;
            }
            return null; // defer to the defaults
          },
        ),
      ),
      onPressed: widget.onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              widget.likeCnt,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}