import 'package:flutter/widgets.dart';
import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

class MusicViewmodel with ChangeNotifier {
  MusicViewmodel(this._musicRepo);

  final IMusicRepo _musicRepo;

  Future<void> updateMusic(
    int id, {
    String? title,
    String? author,
    String? key,
    String? content,
  }) async {
    await _musicRepo.updateMusic(id, title: title, author: author, key:  key, content: content);
    notifyListeners();
  }

  Future<Music?> getMusic(int id) async {
    return await _musicRepo.getMusic(id);
  }
}
