import 'package:flutter/material.dart';
import 'package:hackernews_api/view_models/comment_list_view_model.dart';
import 'package:hackernews_api/view_models/story_list_view_model.dart';
import 'package:hackernews_api/view_models/story_view_model.dart';
import 'package:hackernews_api/widgets/story_list.dart';
import 'package:provider/provider.dart';
import 'package:hackernews_api/pages/comment_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryListViewModel>(context, listen: false).getTopStories();
  }

  void _movetoComment(BuildContext context, StoryViewModel storyOnTap) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => CommentListViewModel(),
                  child: CommentListPage(story: storyOnTap),
                )));
  }

  @override
  Widget build(BuildContext context) {
    //final vm = Provider.of<StoryListViewModel>(context); //vm viewModel

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HackerNews', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: Consumer<StoryListViewModel>(builder: (context, vm, child) {
          return StoryList(
            stories: vm.stories,
            ontap: (StoryViewModel story) {
              _movetoComment(context, story);
            },
          );
        }),
      ),
    );
  }
}
