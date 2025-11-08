import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
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
    await db.execute(RepertoryTable.createTable);
    await db.execute(MusicTable.createTable);
  }
}
