import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/models/repertory.dart';

class ListsPageViewModel with ChangeNotifier {
  List<Repertory> repertories = List.empty(growable: true);

  void addRepertory(String name) {
    Repertory repertory = Repertory(name: name, id: repertories.length, musics: List.empty(growable: true));
    repertories.add(repertory);
    notifyListeners();
  }

  Repertory? getRepertoryByIndex(int index) {
    return repertories.isEmpty ? null : repertories[index];
  }

  void renameRepertory(Repertory repertory, String name) {
    repertory.name = name;
    notifyListeners();
  }

  void deleteRepertory(Repertory repertory) {
    repertories.removeWhere((r) => r.id == repertory.id);
    notifyListeners();
  }
}