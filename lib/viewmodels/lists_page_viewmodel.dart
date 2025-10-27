import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/models/repertory.dart';

class ListsPageViewModel with ChangeNotifier {
  final List<Repertory> repertories = [];

  void addRepertory(String name) {
    repertories.add(Repertory(name: name, musics: List.empty(growable: true)));
    notifyListeners();
  }

  Repertory? getRepertoryByIndex(int index) {
    return repertories.isEmpty ? null : repertories[index];
  }
}