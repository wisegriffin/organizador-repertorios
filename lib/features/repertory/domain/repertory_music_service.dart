import 'dart:async';

import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/data/repertory_music_table.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:sqflite/sqlite_api.dart';

class RepertoryMusicService {
  RepertoryMusicService(this._db);

  final Database _db;
  final _controllers = <int, StreamController<List<Music>>>{};

  Future<void> addMusicToRepertory(Repertory repertory, Music music) async {
    // Create a relation in the database
    await _db.insert(RepertoryMusicTable.tableName, {
      RepertoryMusicTable.repertoryId: repertory.id,
      RepertoryMusicTable.musicId: music.id,
    });

    _emitAllFor(repertory.id);
  }

  Future<void> removeMusicFromRepertory(
    Repertory repertory,
    Music music,
  ) async {
    await _db.delete(
      RepertoryMusicTable.tableName,
      where: '''${RepertoryMusicTable.musicId} = ${music.id} 
        AND ${RepertoryMusicTable.repertoryId} = ${repertory.id}''',
    );

    _emitAllFor(repertory.id);
  }

  Stream<List<Music>> watchAllFromRepertory(Repertory repertory) {
    _emitAllFor(repertory.id);
    // Return a new stream for the id of repertory if not already exits
    return _controllers.putIfAbsent(repertory.id, () {
      final controller = StreamController<List<Music>>.broadcast();
      _emitAllFor(repertory.id);
      return controller;
    }).stream;
  }

  void _emitAllFor(int repertoryId) async {
    final result = await _db.rawQuery(
      '''
      SELECT * FROM ${MusicTable.tableName} 
        WHERE ${MusicTable.columnId} IN (
          SELECT ${RepertoryMusicTable.musicId} FROM ${RepertoryMusicTable.tableName} 
            WHERE ${RepertoryMusicTable.repertoryId} = ?
        ) ORDER BY ${MusicTable.columnTitle}
      ''',
      [repertoryId],
    );
    final List<Music> musics = result.map((e) => Music.fromMap(e)).toList();
    _controllers[repertoryId]?.add(musics);
  }

  void dispose() {
    _controllers.forEach((key, value) => _controllers[key]!.close());
  }
}
