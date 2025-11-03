import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  LocalDB._();

  static final LocalDB instance = LocalDB._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database =  await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'local.db'),
      version: 1,
      onCreate: (db, version) => _onCreate(db, version),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_createRepertories);
  }

  final String _createRepertories= '''
    CREATE TABLE IF NOT EXISTS repertories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL
    );
    ''';
}
