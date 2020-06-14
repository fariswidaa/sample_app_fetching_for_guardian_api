import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const guardianTABLE = 'News';

class DBProvider {
  // create a singleton
  DBProvider._();
  static final db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      print("here we first instantiate the ,"
          "data base from previous version ");
      return _database;
    } else {
      print("here we first instantiate the data base ,"
          "a brand new one ");
      return initDB();
    }
  }


  Future<Database> initDB() async {
    final database = await openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'Guardian_DB.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        print("execute the creation of the database with the version number of $version");
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE $guardianTABLE(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, image TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database ;
  }
}