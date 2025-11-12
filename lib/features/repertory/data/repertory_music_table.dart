import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';

class RepertoryMusicTable {
  static const String tableName = 'repertory_music';
  static const String id = 'id';
  static const String repertoryId = 'repertory_id';
  static const String musicId = 'music_id';

  static const String createTable = '''
    CREATE TABLE IF NOT EXISTS repertory_music (
      $id INTEGER PRIMARY KEY AUTOINCREMENT,
      $repertoryId INTEGER NOT NULL,
      $musicId INTEGER NOT NULL,
      FOREIGN KEY ($repertoryId) REFERENCES ${RepertoryTable.tableName} (${RepertoryTable.columnId}) ON DELETE CASCADE,
      FOREIGN KEY ($musicId) REFERENCES ${MusicTable.tableName} (${MusicTable.columnId}) ON DELETE CASCADE
    );
    ''';
}