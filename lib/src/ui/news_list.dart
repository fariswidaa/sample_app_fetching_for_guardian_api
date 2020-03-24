import 'package:flutter/material.dart';
import 'package:sample_app_fetching/src/models/item_model.dart';
import 'package:sample_app_fetching/src/blocs/news_bloc.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllNews();
    return Scaffold(
      appBar: AppBar(
        title: Text('The Guardian'),
      ),
      body: StreamBuilder(
        stream: bloc.allNews,
        builder: (context, AsyncSnapshot<JsonResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<JsonResponse> snapshot) {
    return ListView.builder(
           itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title:Text(snapshot.data.response.results[position].webTitle.toString()),
                subtitle:Text(snapshot.data.response.results[position].webUrl.toString()),
              );
            },
            itemCount: snapshot.data.response.results.length,
          );
  }
}