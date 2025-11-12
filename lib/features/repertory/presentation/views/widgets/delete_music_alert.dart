import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/musics/data/repos/music_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/repertory_music_service.dart';
import 'package:provider/provider.dart';

void showDeleteMusicAlert({
  required BuildContext context,
  required Repertory repertory,
  required Music music,
}) {
  final repertoryMusicService = context.read<RepertoryMusicService>();
  final musicRepo = context.read<MusicRepo>();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete music?'),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            repertoryMusicService.removeMusicFromRepertory(repertory, music);
            musicRepo.deleteMusic(music.id);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    ),
  );
}
