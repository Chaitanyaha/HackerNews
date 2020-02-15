import 'package:flutter/material.dart';
import 'package:hackernews_api/pages/home_page.dart';
import 'package:hackernews_api/view_models/story_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => StoryListViewModel(),
        child: HomePage(),
      ),
    );
  }
}
