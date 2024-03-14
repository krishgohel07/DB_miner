import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static final DataBaseHelper dataBaseHelper = DataBaseHelper._();
  Database? db;

  Future<Database?> initdb() async {
    String path = await getDatabasesPath();
    String databasepath = join(path, 'quotes.db');
    db = await openDatabase(databasepath, version: 1,
        onCreate: (Database db, _) {
      String sql =
          "CREATE TABLE IF NOT EXISTS quotes(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,quote TEXT);";
      db.execute(sql);
    });
    return db;
  }

  Future<void> insertdata(String name, String quote) async {
    db = await initdb();
    String sql = "INSERT INTO quotes(name,quote) VALUES(?,?)";
    List data = [name, quote];
    print("7878787878${data}");
    await db!.rawInsert(sql, data);
  }

  Future<List<Map<String, dynamic>>> fetchdata() async {
    db = await initdb();
    String sql = "SELECT * FROM quotes";
    List<Map<String, dynamic>> data = await db!.rawQuery(sql);
    print(data);
    return data;
  }
}
