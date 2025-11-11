import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/repertory_music_service.dart';

class RepertoryMusicViewmodel with ChangeNotifier {
  RepertoryMusicViewmodel(this._repertoryMusicService);

  List<Music> _musics = [];
  List<Music> get musics => List.unmodifiable(_musics);

  final RepertoryMusicService _repertoryMusicService;
  StreamSubscription<List<Music>>? _streamSubscription;

  void selectRepertoryToWatch(Repertory repertory) {
    // Cancel the previous stream if exists
    _streamSubscription?.cancel();

    // Listen to the music list of specified repertory
    _streamSubscription = _repertoryMusicService
        .watchAllFromRepertory(repertory)
        .listen((event) {
          _musics = event;
          notifyListeners();
        });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
