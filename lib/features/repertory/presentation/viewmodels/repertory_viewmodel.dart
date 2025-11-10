import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/contracts/irepertory_repo.dart';

class RepertoryViewmodel with ChangeNotifier {
  RepertoryViewmodel(this._repertoryRepo) {
    _subscription = _repertoryRepo.watchAll().listen((data) {
      _repertories = data;
      notifyListeners();
    });
    _repertoryRepo.fetchAll();
  }

  late final StreamSubscription<List<Repertory>> _subscription;

  final IRepertoryRepo _repertoryRepo;

  List<Repertory> _repertories =  [];
  List<Repertory> get repertories => List.unmodifiable(_repertories);

  Future<void> addRepertory(String name) async {
    await _repertoryRepo.createRepertory(name);
  }

  Repertory? getRepertoryByIndex(int index) {
    return repertories.isEmpty ? null : repertories[index];
  }

  Future<void> renameRepertory(Repertory repertory, String name) async {
    await _repertoryRepo.renameRepertory(repertory.id, name);
  }

  Future<void> deleteRepertory(Repertory repertory) async {
    await _repertoryRepo.deleteRepertory(repertory.id);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
