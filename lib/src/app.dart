import 'package:flutter/material.dart';
import 'ui/news_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NewsList(),
      ),
    );
  }
}
