import 'package:flutter/material.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:organizador_repertorios/models/repertory.dart';
import 'package:provider/provider.dart';

void showDeleteRepertoryAlert({
  required BuildContext context,
  required Repertory repertory,
}) {
  final viewmodel = Provider.of<ListsPageViewModel>(context, listen: false);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Delete repertory?'),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            viewmodel.deleteRepertory(repertory);
            Navigator.pop(context);
          },
          child: Text(
            'Delete',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    ),
  );
}
