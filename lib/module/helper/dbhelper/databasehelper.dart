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
      print("data success");
    });
    return db;
  }

  Future<void> insertdata(String name, String quote) async {
    db = await initdb();
    String sql = "INSERT INTO quotes(name,quote) VALUES(?,?)";
    List data = [name, quote];
    print("7878787878${data}");
    print("inserted");
    await db!.rawInsert(sql, data);
  }

  Future<List<Map<String, dynamic>>> fetchdata() async {
    db = await initdb();
    String sql = "SELECT * FROM quotes";
    List<Map<String, dynamic>> data = await db!.rawQuery(sql);
    print("fetched");
    return data;
  }

  Future<void> deleteData(String quote) async {
    db = await initdb();
    String sql = "DELETE FROM quotes WHERE quote = ?";
    await db!.rawDelete(sql, [quote]);
  }
}
