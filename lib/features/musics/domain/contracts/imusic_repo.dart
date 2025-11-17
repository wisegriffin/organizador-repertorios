import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

abstract class IMusicRepo { 
  Future<Music> createMusic({required String title, String? author, String? key});
  Future<void> deleteMusic(int id);
  Future<void> updateMusic(int id, {String? title, String? author, String? key, String? content});
  Future<Music?> getMusic(int id);
}