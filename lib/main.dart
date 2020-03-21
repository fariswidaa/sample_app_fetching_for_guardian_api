import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:sample_app_fetching/json/json_reponse.dart' ;

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Parsing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Response(),
    );
  }
}

class Response extends StatefulWidget {
  Response({Key key, this.url}) : super(key: key);

  final String url;

  @override
  ResponseState createState() => ResponseState();
}

class ResponseState extends State<Response> {
  JsonResponse response;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Json Parsing'),
      ),
      body:  Container(
        child:_buildNewsWidget(),
      ),
    );
  }

    _buildNewsWidget() {
    return FutureBuilder<JsonResponse>(
      future : fetchAndParseUsers(),
      builder: (context, AsyncSnapshot<JsonResponse> asyncSnapshot) {
        // check if the data does exist
        if (asyncSnapshot.hasData) {
          print (asyncSnapshot.toString());
          print ('has data');
          return ListView.builder(
           itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title:Text(asyncSnapshot.data.response.results[position].webTitle.toString()),
                subtitle:Text(asyncSnapshot.data.response.results[position].webUrl.toString()),
              );
            },
            itemCount: asyncSnapshot.data.response.results.length,
          );
        }
        // else if the data doesn't exist
        else if (asyncSnapshot.hasError) {
          print('error');
          return Text('${asyncSnapshot.error}');
        }
        // return a circular avatar
        return
          Center(child: CircularProgressIndicator());
      },
    );
  }

}


final jsonEndpoint =
    'https://content.guardianapis.com/politics?page-size=10&show-fields=thumbnail&api-key=ec0a178d-8280-418f-9042-392c14c03830';



Future<JsonResponse> fetchAndParseUsers() async {
 // fetching the API
 http.Response response = await http.get(jsonEndpoint);

 if (response.statusCode == 200) {
 print ('successful !');
    return JsonResponse.fromJson(json.decode(response.body));
  } else {
    // else throw an Exception
    print ('can\'t connect to the server');
    throw new Exception('can\'t connect to the Server :< ');
  }

}
