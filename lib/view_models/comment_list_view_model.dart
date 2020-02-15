import 'package:hackernews_api/view_models/comment_view_model.dart';
import 'package:hackernews_api/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:hackernews_api/view_models/story_view_model.dart';

class CommentListViewModel extends ChangeNotifier {
  List<CommentViewModel> comments = List<CommentViewModel>();

  void getCommentByStory(StoryViewModel storyvm) async {
    final results = await Webservice().getCommentByStory(storyvm.story);
    this.comments =
        results.map((item) => CommentViewModel(comment: item)).toList();
    notifyListeners();
    print(this.comments);
  }
}
