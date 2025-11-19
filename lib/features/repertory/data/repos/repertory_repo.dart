import 'dart:async';

import 'package:organizador_repertorios/features/repertory/data/repertory_music_table.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/contracts/irepertory_repo.dart';
import 'package:sqflite/sqflite.dart';

class RepertoryRepo implements IRepertoryRepo {
  final Database _db;
  final StreamController<List<Repertory>> _streamController =
      StreamController.broadcast();

  RepertoryRepo(this._db);

  @override
  Future<void> createRepertory(String name) async {
    await _db.insert(RepertoryTable.tableName, {
      RepertoryTable.columnName: name,
    });
    _emitAll();
  }

  @override
  Future<void> deleteRepertory(int id) async {
    await _db.delete(
      RepertoryTable.tableName,
      where: '${RepertoryTable.columnId} = ?',
      whereArgs: [id],
    );
    _emitAll();
  }

  @override
  Future<void> renameRepertory(int id, String name) async {
    await _db.update(
      RepertoryTable.tableName,
      {RepertoryTable.columnName: name},
      where: '${RepertoryTable.columnId} = ?',
      whereArgs: [id],
    );
    _emitAll();
  }

  @override
  Stream<List<Repertory>> watchAll() => _streamController.stream;

  void _emitAll() async {
    final result = await _db.query(RepertoryTable.tableName);
    final list = result.map((e) => Repertory.fromMap(e)).toList();
    _streamController.add(list);
  }

  @override
  void fetchAll() {
    _emitAll();
  }
  
  @override
  Future<int> countMusics(int id) async {
    final result = await _db.rawQuery('''
      SELECT COUNT(${RepertoryMusicTable.musicId}) AS total FROM ${RepertoryMusicTable.tableName}
        WHERE ${RepertoryMusicTable.repertoryId} = ?
      ''', [id]);

      return result.single['total'] as int;
  }
}
