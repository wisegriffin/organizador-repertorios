import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_repertorios/core/databases/db.dart';
import 'package:organizador_repertorios/repos/implementations/repertory_repo.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Database localDB = await LocalDB.instance.database;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ListsPageViewModel(RepertoryRepo(localDB)),
        child: App(),
      ),
    );
  });
}
