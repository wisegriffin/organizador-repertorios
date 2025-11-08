import 'package:flutter/widgets.dart';
import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';

class MusicViewmodel with ChangeNotifier {
  MusicViewmodel(this._musicRepo);

  final IMusicRepo _musicRepo;
  
}