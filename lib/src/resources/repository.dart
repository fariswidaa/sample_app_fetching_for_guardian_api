import 'dart:async';
import 'package:sample_app_fetching/networking/news_api_provider.dart';
import 'package:sample_app_fetching/src/models/item_model.dart';

class Repository {
final newsApiProvider = NewsApiProvider();

// fetch data
Future<JsonResponse> fetchAllMovies() => newsApiProvider.fetchMovieList();
}
