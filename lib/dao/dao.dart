import 'package:sample_app_fetching/src/database/database.dart';
import 'package:sample_app_fetching/src/models/database_model.dart';


const todoTABLE = 'News';
class NewsDao {
  
final dbProvider = DBProvider.db;

//Adds new Todo records
Future<int> createTodo(News todo) async {
final db = await dbProvider.database;
var result = db.insert(todoTABLE, todo.toDatabaseMap());
return result;
}

// Get a single todo item
  getTodo(int id) async {
    final db = await dbProvider.database;
    var res = await db.query( todoTABLE , where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? News.fromDatabaseMap(res.first) : null;
  }

//Get All Todo items
//Searches if query string was passed
Future<List<News>> getTodos({List<String> columns, String query}) async {
final db = await dbProvider.database;

List<Map<String, dynamic>> result;

if (query != null) {
if (query.isNotEmpty)
print ('fetching data with query');
result = await db.query(todoTABLE,
columns: columns,
where: 'description LIKE ?',
whereArgs: ["%$query%"]);
} else {
print ('fetching data without query');
result = await db.query(todoTABLE, columns: columns);
}

List<News> todos = result.isNotEmpty
? result.map((item) => News.fromDatabaseMap(item)).toList()
: [];
return todos;
}

//Update Todo record
Future<int> updateTodo(News todo) async {
final db = await dbProvider.database;

var result = await db.update(todoTABLE, todo.toDatabaseMap(),
where: "id = ?", whereArgs: [todo.id]);

return result;
}

}
