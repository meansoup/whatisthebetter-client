
import 'package:client/backend/witb-server/createcomment.dart';
import 'package:client/backend/witb-server/listcomment.dart';
import 'package:client/domain/comment.dart';
import 'package:client/service/login.dart';

Future<Comment> createCommentWithCheckLogin(String postId, String contentId, String text) async {
  var witbToken = await getTokenThrowErrorIfNotLoggedIn();

  var createCommentRequest = CreateCommentRequest(
    postId: postId,
    contentId: contentId,
    text: text,
  );

  var createCommentResponse = await createComment(witbToken, createCommentRequest);

  return Comment(
      commentId: createCommentResponse.commentId,
      uid: "uid",
      text: text,
      createdAgo: createCommentResponse.createdAgo
  );
}

Future<List<Comment>> listCommentsWithCheckLogin(String postId, String contentId, String? listingPoint) async {
  var witbToken = await getTokenIfLoggedIn();
  return await listComments(witbToken, postId, contentId, listingPoint);
}