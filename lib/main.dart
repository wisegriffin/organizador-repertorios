import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ListsPageViewModel(),
        child: App(),
      ),
    );
  });
}
