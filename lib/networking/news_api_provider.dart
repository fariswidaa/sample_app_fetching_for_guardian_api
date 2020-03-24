import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:sample_app_fetching/src/models/item_model.dart';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = 'ec0a178d-8280-418f-9042-392c14c03830';

  Future<JsonResponse> fetchMovieList() async {
    print("entered");
    final response = await client.get(
        'https://content.guardianapis.com/politics?page-size=10&show-fields=thumbnail&api-key=$_apiKey');
    print(response.body.toString());
    if (response.statusCode == 200) {
// If the call to the server was successful, parse the JSON
      return JsonResponse.fromJson(json.decode(response.body));
    } else {
// If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
