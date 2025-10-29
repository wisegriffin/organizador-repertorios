import 'package:flutter/material.dart';
import 'package:organizador_repertorios/models/repertory.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:provider/provider.dart';

class TrailingRepertoryOptions extends StatelessWidget {
  const TrailingRepertoryOptions(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<ListsPageViewModel>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          // TODO: implement rename repertory
          onPressed: () => print('rename'),
          label: Text('Rename'),
          icon: Icon(Icons.abc),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ElevatedButton.icon(
            onPressed: () {
              viewmodel.deleteRepertory(_repertory);
              Navigator.pop(context);
            },
            label: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    );
  }
}
