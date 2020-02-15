import 'dart:convert';

import 'package:hackernews_api/models/story.dart';
import 'package:hackernews_api/models/comment.dart';

import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Story>> getTopStories() async {
    final url =
        'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty';

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable id = jsonDecode(response.body);
      return Future.wait(id.take(20).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw Exception('Unable to fetch the data');
    }
  }

  Future<Story> _getStory(int id) async {
    final url =
        'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Story.fromJson(json);
    } else {
      throw Exception('Unable to fetch the data');
    }
  }

  Future<dynamic> getCommentByStory(Story storyid) async {
    return Future.wait(storyid.idComment.map((e) async {
      final url =
          'https://hacker-news.firebaseio.com/v0/item/$e.json?print=pretty';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Comment.fromJson(json);
      } else {
        throw Exception('Fetch failed');
      }
    }));
  }
}
