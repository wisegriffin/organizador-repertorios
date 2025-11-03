import 'dart:async';

import 'package:organizador_repertorios/entities/repertory.dart';
import 'package:organizador_repertorios/repos/contracts/irepertory_repo.dart';
import 'package:sqflite/sqflite.dart';

class RepertoryRepo implements IRepertoryRepo {
  final Database _db;
  final StreamController<List<Repertory>> _streamController = StreamController.broadcast();

  RepertoryRepo(this._db);

  //TODO: see if it needs to use .then()
  
  @override
  Future<void> createRepertory(String name) async {
    await _db.insert('repertories', {'name': name});
    _emitAll();
  }

  @override
  Future<void> deleteRepertory(int id) async {
    await _db.delete('repertories', where: 'id == ?', whereArgs: [id]);
    _emitAll();
  }

  @override
  Future<void> renameRepertory(int id, String name) async {
    await _db.update(
      'repertories',
      {'name': name},
      where: 'id == ?',
      whereArgs: [id],
    );
    _emitAll();
  }

  @override
  Stream<List<Repertory>> watchAll() => _streamController.stream;

  void _emitAll() async {
    final result = await _db.query('repertories');
    final list = result.map((e) => Repertory.fromMap(e)).toList();
    _streamController.add(list);
  }
  
  @override
  void fetchAll() {
    _emitAll();
  }
}
