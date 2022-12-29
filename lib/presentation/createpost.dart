import 'package:client/data/witb-server/createpost.dart';
import 'package:flutter/material.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final content1TitleController = TextEditingController();
    final content1TextController = TextEditingController();
    final content2TitleController = TextEditingController();
    final content2TextController = TextEditingController();

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('CreatePost Example'),
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: <Widget>[
                    Container(
                      child: TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'post title',
                            hintText: 'Enter your post title'
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            controller: content1TitleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'content title',
                                hintText: 'Enter your content title'
                            ),
                          ),
                          TextField(
                            controller: content1TextController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'content text',
                                hintText: 'Enter your content text'
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            controller: content2TitleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'content title',
                                hintText: 'Enter your content title'
                            ),
                          ),
                          TextField(
                            controller: content2TextController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'content text',
                                hintText: 'Enter your content text'
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          createPost(CreatePostDto(
                              title: titleController.text,
                              content1: CreatePostContentDto(
                                  title: content1TitleController.text,
                                  text: content1TextController.text,
                              ),
                              content2: CreatePostContentDto(
                                  title: content2TitleController.text,
                                  text: content2TextController.text
                              )
                          ));
                        },
                        child: Text(
                          'create post',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    )
                  ]
              )
          ),
        )
    );
  }

}