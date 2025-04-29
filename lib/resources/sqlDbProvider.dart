import 'dart:io';
import 'package:path/path.dart';
import 'package:project_app/model/biodata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Sqldbprovider {
  static Database? db;

  static init() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    final path = join(docDirectory.path, 'profile.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute('''
            CREATE TABLE Biodata
            (
              user_name TEXT PRIMARY KEY,
              first_name TEXT,
              last_name TEXT,
              email_address TEXT,
              phone_number INTEGER,
              gender TEXT,
            )
          ''');
      },
    );
    print(await Sqldbprovider.fetchData(1));
  }

  static Future<int?> addItem(Biodata item) async {
    int suc = await db!.insert(
      'Biodata',
      item.intoDb(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return suc;
    return null;
  }

  static Future<Biodata?> fetchData(int id) async {
    List<Map<String, dynamic>> map = await db!.query(
      'Biodata',
      columns: null,
      where: 's_no = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return Biodata.fromDb(map.first);
    }
    return null;
  }
}
