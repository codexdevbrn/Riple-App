import 'package:path/path.dart';
import 'package:ripel_application/database/DAO/list_DAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'lists.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ListDao.tableSql);
    },
    version: 1,
  );
}
