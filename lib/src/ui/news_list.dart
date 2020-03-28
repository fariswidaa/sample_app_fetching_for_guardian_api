import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share/share.dart';

import 'package:sample_app_fetching/src/models/item_model.dart';
import 'package:sample_app_fetching/src/blocs/news_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllNews();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarWidget(),
      body: StreamBuilder(
        stream: bloc.allNews,
        builder: (context, AsyncSnapshot<JsonResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return errorWidget();
          }
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.amber,
          ));
        },
      ),
    );
  }

  Widget errorWidget() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.blue[900],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 180.0,
              color: Colors.white,
            ),
            Text(
              "Oh no! We can't connect right now!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<JsonResponse> snapshot) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Container(
            width: 344.0,
            height: 148.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              // color: Colors.blue[700],
              elevation: 3.0,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                          image: NetworkImage(snapshot.data.response
                              .results[position].fields.thumbnail),
                        ),
                      ),
                      title: Text(
                        snapshot.data.response.results[position].webTitle
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.raleway(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Full Article'),
                              onPressed: () {
                                urlLaunch(context, snapshot, position);
                              },
                            ),
                            FlatButton(
                              child: const Text('Share'),
                              onPressed: () {
                                return share(context, snapshot, position);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: snapshot.data.response.results.length,
    );
  }

  share(BuildContext context, AsyncSnapshot<JsonResponse> jsonResponse,
      int position) {
    //  final RenderBox box = context.findRenderObject();

    Share.share(
      "${jsonResponse.data.response.results[position].webTitle} ",
      subject: jsonResponse.data.response.results[position].webUrl,
      //  sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
    );
  }

  urlLaunch(BuildContext context, AsyncSnapshot<JsonResponse> snapshot,
      int position) async {
    final fullArticle = snapshot.data.response.results[position].webUrl;
    if (await canLaunch(fullArticle)) {
      await launch(fullArticle, forceSafariVC: false);
    } else {
      throw 'Could not launch $fullArticle';
    }
  }
}


AppBar appBarWidget(){
     return AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('The Guardian'),
      );
  }