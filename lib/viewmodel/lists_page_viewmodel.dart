import 'package:flutter/foundation.dart';

class ListsPageViewModel with ChangeNotifier {
  final repertories = ['Congregacionais', 'Palavrantiga', 'Stênio Marcius'];

  void addRepertory(String name) {
    repertories.add(name);
    notifyListeners();
  }
}