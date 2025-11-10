import 'package:flutter/widgets.dart';
import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

class MusicViewmodel with ChangeNotifier {
  MusicViewmodel(this._musicRepo);

  final IMusicRepo _musicRepo;

  Future<Music> createMusic({required String title, String? author, String? key}) async {
    return Music(id: 0, title: title, author: author, key: key);
  }
  
}