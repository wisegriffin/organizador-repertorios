import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

class MusicRepo extends IMusicRepo {
  @override
  Future<Music> createMusic(String title) {
    // TODO: implement createMusic
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMusic(int id) {
    // TODO: implement deleteMusic
    throw UnimplementedError();
  }
  
}