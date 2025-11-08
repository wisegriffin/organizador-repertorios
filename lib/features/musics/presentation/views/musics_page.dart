import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/music_item_view.dart';
import 'package:provider/provider.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<RepertoryViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(_repertory.name),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 10,
        shape: BoxBorder.all(),
        actions: [
          IconButton(
            tooltip: 'add music',
            onPressed: () {
              viewmodel.addMusic(
                _repertory,
                Music(
                  id: _repertory.musics.length,
                  title: _repertory.musics.length.toString(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            MusicItemView(_repertory.musics[index]),
        itemCount: _repertory.musics.length,
      ),
    );
  }
}
