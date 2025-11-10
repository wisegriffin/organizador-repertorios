import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

abstract class IMusicRepo { 
  Future<Music> createMusic({required String title, String? author, String? key});
  Future<void> deleteMusic(int id);
}