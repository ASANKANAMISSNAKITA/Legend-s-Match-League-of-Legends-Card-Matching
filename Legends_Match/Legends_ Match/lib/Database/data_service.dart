// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  return openDatabase(
    join(path, 'scores.db'),
    onCreate: (database, version) async {
      await database.execute(
        "CREATE TABLE scores(id INTEGER PRIMARY KEY, name TEXT, score INTEGER)",
      );
    },
    version: 1,
  );
}

Future<void> insertScore(String name, int score) async {
  Database db = await initializeDB();
  await db.insert('scores', {'name': name, 'score': score});
}
