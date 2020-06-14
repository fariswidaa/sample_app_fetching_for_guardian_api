import 'dart:async';

import 'package:sample_app_fetching/src/models/database_model.dart';
import 'package:sample_app_fetching/src/resources/repository_database.dart';


class NewsBloc {
//Get instance of the Repository
final _todoRepository = NewsRepository();

//Stream controller is the 'Admin' that manages
//the state of our stream of data like adding
//new data, change the state of the stream
//and broadcast it to observers/subscribers
final _todoController = StreamController<List<News>>.broadcast();

get todos => _todoController.stream;

NewsBloc() {
print ('the bloc constructor');
getTodos();
}

getTodos({String query}) async {
//sink is a way of adding data reactively to the stream
//by registering a new event
_todoController.sink.add(await _todoRepository.getAllTodos(query: query));
print ('get todos using the bloc');
}

addTodo(News todo) async {
await _todoRepository.insertTodo(todo);
getTodos();
}

updateTodo(News todo) async {
await _todoRepository.updateTodo(todo);
getTodos();
}


dispose() {
_todoController.close();
}
}
