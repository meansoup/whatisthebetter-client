import 'package:client/backend/witb-server/cancellikecontent.dart';
import 'package:client/backend/witb-server/createpost.dart';
import 'package:client/backend/witb-server/getpost.dart';
import 'package:client/backend/witb-server/likecontent.dart';
import 'package:client/domain/post.dart';
import 'package:client/service/login.dart';

Future<String> createPostWithCheckLogin(
    String postTitle, String content1Title, String content1Text,
    String content2Title, String content2Text
    ) async {

  var witbToken = await getTokenThrowErrorIfNotLoggedIn();

  var postId = await createPost(
    witbToken,
    CreatePostRequest(
      title: postTitle,
      content1: CreatePostContentRequest(
        title: content1Title,
        text: content1Text,
      ),
      content2: CreatePostContentRequest(
        title: content2Title,
        text: content2Text
      )
    )
  );

  return postId;
}

Future<PostData> getPostWithTokenIfLoggedIn(String postId) async {
  var witbToken = await getTokenIfLoggedIn();

  return await getPost(witbToken, postId);
}

Future<bool> likeContentWithCheckLogin(String postId, String contentId) async {
  var witbToken = await getTokenThrowErrorIfNotLoggedIn();
  return likeContent(witbToken, postId, contentId);
}

Future<bool> cancelLikeContentWithCheckLogin(String postId, String contentId) async {
  var witbToken = await getTokenThrowErrorIfNotLoggedIn();
  return cancelLikeContent(witbToken, postId, contentId);
}
