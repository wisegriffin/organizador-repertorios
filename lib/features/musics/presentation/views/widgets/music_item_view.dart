import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/widgets/child_sized_modal_bottom_sheet.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/music_content_view.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/widgets/trailing_music_options.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';

class MusicItemView extends StatelessWidget {
  const MusicItemView(this._music, this._repertory, {super.key});

  final Repertory _repertory;
  final Music _music;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        title: Text(_music.title),
        // TODO: solve bug. key appear as 'null'
        subtitle: Text('${_music.author} - ${_music.key}'),
        trailing: IconButton(
          onPressed: () => showChildSizedModalBottomSheet(
            context: context,
            child: TrailingMusicOptions(_music, _repertory),
          ),
          icon: Icon(Icons.more_vert),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder:  (context) => MusicContentView(_music)),
        ),
      ),
    );
  }
}
