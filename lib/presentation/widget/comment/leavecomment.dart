import 'package:flutter/material.dart';

class LeaveCommentWidget extends StatefulWidget {
  const LeaveCommentWidget({
    Key? key,
  }): super(key: key);

  @override
  State<LeaveCommentWidget> createState() => LeaveCommentWidgetState();
}

class LeaveCommentWidgetState extends State<LeaveCommentWidget> {

  @override
  Widget build(BuildContext context) {
    final leaveCommentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            controller: leaveCommentController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'leave comment',
                hintText: 'Enter your comment'
            ),
          ),
          TextButton(onPressed: () {  }, child: Text("textButton"),)
        ],
      ),
    );
  }
}