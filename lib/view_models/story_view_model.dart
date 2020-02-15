import 'package:hackernews_api/models/story.dart';

class StoryViewModel {
  final Story story;

  StoryViewModel({this.story});

  String get title {
    return this.story.title;
  }

  String get url {
    return this.story.url;
  }

  int get lenComment {
    return this.story.idComment.length;
  }
}
