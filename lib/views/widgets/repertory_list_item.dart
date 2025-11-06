import 'package:flutter/material.dart';
import 'package:organizador_repertorios/entities/repertory.dart';
import 'package:organizador_repertorios/views/pages/musics_page.dart';
import 'package:organizador_repertorios/views/widgets/trailing_repertory_options.dart';
import 'package:organizador_repertorios/core/widgets/child_sized_modal_bottom_sheet.dart';

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

        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MusicsPage(_repertory)),
        ),

        trailing: IconButton(
          onPressed: () => showChildSizedModalBottomSheet(
            context: context,
            child: TrailingRepertoryOptions(_repertory),
          ),
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
