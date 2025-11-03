import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/entities/repertory.dart';
import 'package:organizador_repertorios/repos/contracts/irepertory_repo.dart';

class ListsPageViewModel with ChangeNotifier {
  ListsPageViewModel(this.repertoryRepo) {
    _listenRepertories();
    repertoryRepo.fetchAll();
  }

  final IRepertoryRepo repertoryRepo;
  List<Repertory> repertories = List.empty(growable: true);

  late final StreamSubscription<List<Repertory>> _subscription;

  Future<void> addRepertory(String name) async {
    await repertoryRepo
        .createRepertory(name)
        .then((value) => notifyListeners());
  }

  void _listenRepertories() {
    _subscription = repertoryRepo.watchAll().listen((data) {
      repertories = data;
      notifyListeners();
    });
  }

  Repertory? getRepertoryByIndex(int index) {
    return repertories.isEmpty ? null : repertories[index];
  }

  Future<void> renameRepertory(Repertory repertory, String name) async {
    await repertoryRepo
        .renameRepertory(repertory.id, name)
        .then((value) => notifyListeners());
  }

  Future<void> deleteRepertory(Repertory repertory) async {
    await repertoryRepo
        .deleteRepertory(repertory.id)
        .then((value) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
