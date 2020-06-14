
import 'package:sample_app_fetching/dao/dao.dart';
import 'package:sample_app_fetching/src/models/database_model.dart';

class NewsRepository {

final todoDao = NewsDao();

Future getAllTodos({String query}) => todoDao.getTodos(query: query);

Future insertTodo(News todo) => todoDao.createTodo(todo);

Future updateTodo(News todo) => todoDao.updateTodo(todo);

}