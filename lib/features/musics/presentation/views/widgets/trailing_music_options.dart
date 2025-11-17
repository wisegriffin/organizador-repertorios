import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/music_content_view.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/presentation/views/widgets/delete_music_alert.dart';

class TrailingMusicOptions extends StatelessWidget {
  const TrailingMusicOptions(this._music, this._repertory, {super.key});

  final Music _music;
  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    final Color deleteColor = Theme.of(context).colorScheme.error;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Edit button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MusicContentView(_music, acessMode: AcessMode.edit,)),
            );
          },
          label: Text('Edit'),
          icon: Icon(Icons.edit),
        ),
        // Delete button
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
            showDeleteMusicAlert(
              context: context,
              repertory: _repertory,
              music: _music,
            );
          },
          label: Text('Delete', style: TextStyle(color: deleteColor)),
          icon: Icon(Icons.delete, color: deleteColor),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
