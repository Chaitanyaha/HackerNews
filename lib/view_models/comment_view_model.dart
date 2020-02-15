import 'package:hackernews_api/models/comment.dart';


class CommentViewModel {
  final Comment comment;

  CommentViewModel({this.comment});

  String get title {
    return this.comment.title;
  }

  int get commentId {
    return this.comment.commentId;
  }
}
