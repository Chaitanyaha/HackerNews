import 'package:flutter/material.dart';
import 'package:hackernews_api/view_models/comment_list_view_model.dart';
import 'package:hackernews_api/view_models/story_view_model.dart';
import 'package:provider/provider.dart';

class CommentListPage extends StatefulWidget {
  CommentListPage({this.story});
  StoryViewModel story;
  @override
  _CommentListPageState createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommentListViewModel>(context, listen: false)
        .getCommentByStory(widget.story);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CommentListViewModel>(context);
    print(vm.comments.length);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.story.title),
        ),
        body: ListView.builder(
            itemCount: vm.comments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                    alignment: Alignment.center,
                    child: Text('k'),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange)), //?? '' if null show ''emptyS,
                leading: Text('$index'),
              );
            }));
  }
}
//vm.comments[index].title ?? ''
