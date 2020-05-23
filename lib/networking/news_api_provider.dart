import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample_app_fetching/src/models/item_model.dart';

class NewsApiProvider {
 
  final _apiKey = 'api_key';

  Future<JsonResponse> fetchMovieList() async {
    print("entered");
    final response = await http.get(
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
