import 'package:flutter/material.dart';
import 'package:organizador_repertorios/entities/music.dart';
import 'package:organizador_repertorios/entities/repertory.dart';
import 'package:organizador_repertorios/viewmodels/repertory_viewmodel.dart';
import 'package:organizador_repertorios/views/widgets/music_item_view.dart';
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
              viewmodel.addMusic(_repertory, Music(id: 0, title: _repertory.musics.length.toString()));
            },
            icon: Icon(Icons.add), 
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MusicItemView(_repertory.musics[index]),
        itemCount: _repertory.musics.length,
      ),
    );
  }
}
