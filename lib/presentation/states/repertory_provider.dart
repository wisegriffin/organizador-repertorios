import 'package:flutter/foundation.dart';

class RepertoryProvider with ChangeNotifier {
  final repertories = ['Congregacionais', 'Palavrantiga', 'Stênio Marcius'];

  void addRepertory(String name) {
    repertories.add(name);
    notifyListeners();
  }
}