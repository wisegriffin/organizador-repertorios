import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';

class MusicItemView extends StatelessWidget {
  const MusicItemView(this._music, {super.key});

  final Music _music;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        title: Text(_music.title),
        subtitle: Text(_music.author),
      ),
    );
  }
}
