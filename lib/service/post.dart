import 'package:client/backend/witb-server/createpost.dart';
import 'package:client/backend/witb-server/likecontent.dart';
import 'package:client/service/login.dart';

Future<void> createPostWithCheckLogin(
    String postTitle, String content1Title, String content1Text,
    String content2Title, String content2Text
    ) async {

  var witbToken = await loginIfNotLoggedIn();

  createPost(
    witbToken,
    CreatePostDto(
      title: postTitle,
      content1: CreatePostContentDto(
        title: content1Title,
        text: content1Text,
      ),
      content2: CreatePostContentDto(
        title: content2Title,
        text: content2Text
      )
    )
  );
}

Future<void> likeContentWithCheckLogin(String postId, String contentId) async {
  var witbToken = await loginIfNotLoggedIn();
  likeContent(witbToken, postId, contentId);
}