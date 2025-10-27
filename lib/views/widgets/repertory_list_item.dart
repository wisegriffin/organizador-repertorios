import 'package:flutter/material.dart';
import 'package:organizador_repertorios/models/repertory.dart';

class RepertoryListItem extends StatelessWidget {
  const RepertoryListItem(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_repertory.name),
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        subtitle: Text('Musics: ${_repertory.musics.length}'),

        // TODO: Handle trailing button OnPressed
        trailing: IconButton(
          onPressed: () => print('trailing pressed'),
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
