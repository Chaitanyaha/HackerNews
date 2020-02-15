import 'package:flutter/material.dart';
import 'package:hackernews_api/view_models/story_list_view_model.dart';
import 'package:hackernews_api/view_models/story_view_model.dart';

class StoryList extends StatelessWidget {
  final Function(StoryViewModel) ontap;
  List<StoryViewModel> stories;
  StoryList({this.stories, this.ontap});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final story = stories[index];
        return ListTile(
          title: Text(story.title),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(' ${story.lenComment}'),
              Text('Comments', style: TextStyle(fontSize: 10))
            ],
          ),
          onTap: () {
            ontap(story);
          },
        );
      },
    );
  }
}
