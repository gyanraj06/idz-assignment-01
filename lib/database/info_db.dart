import 'package:idzassignment/database/database_services.dart';
import 'package:idzassignment/info.dart';
import 'package:sqflite/sqflite.dart';

class InfoDB {
  final tableName = 'infos';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "name" TEXT NOT NULL,
      "email" TEXT NOT NULL,
      "month" TEXT NOT NULL,
      "date" INTEGER NOT NULL,
      "year" INTEGER NOT NULL,
      PRIMARY KEY("email")
    );""");
  }

  Future<int> create(
      {required String name,
      required String email,
      required String month,
      required int date,
      required int year}) async {
    final database = await DatabaseServices().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (name, email, month, date, year) VALUES (?,?,?,?,?)''',
      [name, email, month, date, year],
    );
  }

  Future<List<Info>> fetchAll() async {
    final database = await DatabaseServices().database;
    final infos = await database.rawQuery('''SELECT * from $tableName;''');

    return infos.map((info) => Info.fromSqfliteDatabase(info)).toList();
  }
}

//make a id and make it primary if any error comes
