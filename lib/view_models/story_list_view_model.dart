import 'package:flutter/cupertino.dart';
import 'package:hackernews_api/services/webservice.dart';
import 'package:hackernews_api/view_models/story_view_model.dart';

import 'story_view_model.dart';

class StoryListViewModel extends ChangeNotifier{
  List<StoryViewModel> stories = List<StoryViewModel>();

  Future<dynamic> getTopStories() async {
    final results = await Webservice().getTopStories();
    this.stories =
        results.map((story) => StoryViewModel(story: story)).toList();
        notifyListeners();
  }
}
