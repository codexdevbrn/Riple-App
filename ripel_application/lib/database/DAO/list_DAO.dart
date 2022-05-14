import 'package:ripel_application/database/list_database.dart';
import 'package:ripel_application/models/list.dart';
import 'package:sqflite/sqflite.dart';

class ListDao {
  static const String _tableName = 'lists';
  static const String _id = 'id';
  static const String _title = 'title';
  static const String _description = 'description';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_title TEXT, '
      '$_description INTEGER)';

  Future<int> save(Listing listing) async {
    final Database db = await getDatabase();
    Map<String, dynamic> listingMap = _toMap(listing);
    return db.insert(_tableName, listingMap);
  }

  Future<List<Listing>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Listing> listingFull = _toList(result);
    return listingFull;
  }

  Map<String, dynamic> _toMap(Listing listing) {
    final Map<String, dynamic> listingMap = {};
    listingMap[_title] = listing.title;
    listingMap[_description] = listing.description;
    return listingMap;
  }

  List<Listing> _toList(List<Map<String, dynamic>> result) {
    final List<Listing> listingFull = [];
    for (Map<String, dynamic> row in result) {
      final Listing listing = Listing(
        row[_id],
        row[_title],
        row[_description],
      );
      listingFull.add(listing);
    }
    return listingFull;
  }
}
