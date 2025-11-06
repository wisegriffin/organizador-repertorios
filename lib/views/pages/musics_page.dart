import 'package:flutter/material.dart';
import 'package:organizador_repertorios/entities/repertory.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_repertory.name),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Placeholder(),
        itemCount: _repertory.musics.length,
      ),
    );
  }
}
