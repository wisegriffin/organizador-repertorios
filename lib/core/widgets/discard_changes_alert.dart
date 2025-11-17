import 'package:flutter/material.dart';

Future<bool> showDiscardChangesAlert(BuildContext context) async {
  // Returns true if user wants to discard changes e false if not
  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Discard changes?'),
        content: Text('You have not saved changes'),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          // Cancel button
          OutlinedButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),

          // Discard button
          OutlinedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              'Discard',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      );
    },
  );

  return result ?? false;
}
