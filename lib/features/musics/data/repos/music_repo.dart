import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:sqflite/sqlite_api.dart';

class MusicRepo extends IMusicRepo {
  MusicRepo(this._db);
  final Database _db;

  @override
  Future<Music> createMusic({
    required String title,
    String? author,
    String? key,
  }) async {
    int id = await _db.insert(MusicTable.tableName, {
      MusicTable.columnTitle: title,
      MusicTable.columnAuthor: author,
      MusicTable.columnKey: key,
    });
    final result = await _db.query(MusicTable.tableName, where: '${MusicTable.columnId} == ?', whereArgs: [id]);
    return Music.fromMap(result.single);
  }

  @override
  Future<void> deleteMusic(int id) async {
    // TODO: implement deleteMusic
    throw UnimplementedError();
  }
}
