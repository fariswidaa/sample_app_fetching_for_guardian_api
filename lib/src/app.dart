import 'package:flutter/material.dart';

import 'package:sample_app_fetching/networking/connectivity_service.dart';
import 'package:sample_app_fetching/src/models/connectivity_status.dart';
import 'package:sample_app_fetching/src/ui/news_list.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
builder: (context) => ConnectivityService().connectionStatusController,
child: MaterialApp(
          theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        body: NewsList(),
      ),
    ),
);
  }
}


