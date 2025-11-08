import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/presentation/views/widgets/delete_repertory_alert.dart';
import 'package:organizador_repertorios/features/repertory/presentation/views/widgets/rename_repertory_bottom_sheet.dart';

class TrailingRepertoryOptions extends StatelessWidget {
  const TrailingRepertoryOptions(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
            showRenameRepertoryBottomSheet(_repertory, context: context);
          },
          label: Text('Rename'),
          icon: Icon(Icons.abc),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              showDeleteRepertoryAlert(context: context, repertory: _repertory);
            },
            label: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
