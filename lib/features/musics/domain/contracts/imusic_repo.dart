import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

abstract class IMusicRepo { 
  Future<Music> createMusic(String title);
  Future<void> deleteMusic(int id);
}