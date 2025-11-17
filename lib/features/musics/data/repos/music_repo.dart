import 'package:organizador_repertorios/core/utils/extensions.dart';
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
      MusicTable.columnContent: "",
    });
    final result = await _db.query(
      MusicTable.tableName,
      where: '${MusicTable.columnId} == ?',
      whereArgs: [id],
    );
    return Music.fromMap(result.single);
  }

  @override
  Future<void> deleteMusic(int id) async {
    await _db.delete(
      MusicTable.tableName,
      where: '${MusicTable.columnId} = $id',
    );
  }

  @override
  Future<void> updateMusic(
    int id, {
    String? title,
    String? author,
    String? key,
    String? content,
  }) async {
    final map = <String, Object?>{};
    map.setIfNotNull(MusicTable.columnTitle, title);
    map.setIfNotNull(MusicTable.columnAuthor, author);
    map.setIfNotNull(MusicTable.columnKey, key);
    map.setIfNotNull(MusicTable.columnContent, content);

    await _db.update(
      MusicTable.tableName,
      map,
      where: '${MusicTable.columnId} = ?',
      whereArgs: [id],
    );
  }
  
  @override
  Future<Music?> getMusic(int id) async {
    final result = await _db.query(MusicTable.tableName, where: '${MusicTable.columnId} = ?', whereArgs: [id]);
    try {
      return Music.fromMap(result.single);
    } catch (e) {
      return null;
    }
  }


}
