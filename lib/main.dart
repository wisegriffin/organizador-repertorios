import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_repertorios/core/data/local_db.dart';
import 'package:organizador_repertorios/features/repertory/data/repos/repertory_repo.dart';
import 'package:organizador_repertorios/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';
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
        create: (context) => RepertoryViewmodel(RepertoryRepo(localDB)),
        child: App(),
      ),
    );
  });
}
