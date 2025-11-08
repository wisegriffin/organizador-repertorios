import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/contracts/irepertory_repo.dart';

class RepertoryViewmodel with ChangeNotifier {
  RepertoryViewmodel(this.repertoryRepo) {
    _listenRepertories();
    repertoryRepo.fetchAll();
  }

  final IRepertoryRepo repertoryRepo;
  List<Repertory> repertories = List.empty(growable: true);

  late final StreamSubscription<List<Repertory>> _subscription;

  Future<void> addRepertory(String name) async {
    await repertoryRepo.createRepertory(name);
    notifyListeners();
  }

  Repertory? getRepertoryByIndex(int index) {
    return repertories.isEmpty ? null : repertories[index];
  }

  Future<void> renameRepertory(Repertory repertory, String name) async {
    await repertoryRepo.renameRepertory(repertory.id, name);
    notifyListeners();
  }

  Future<void> deleteRepertory(Repertory repertory) async {
    await repertoryRepo.deleteRepertory(repertory.id);
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void addMusic(Repertory repertory, Music music) {
    repertory.musics.add(music);
    notifyListeners();
  }

  void _listenRepertories() {
    _subscription = repertoryRepo.watchAll().listen((data) {
      repertories = data;
      notifyListeners();
    });
  }
}
