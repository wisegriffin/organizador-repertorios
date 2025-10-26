import 'package:flutter/material.dart';

class RepertoryListItem extends StatelessWidget {
  const RepertoryListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        subtitle: Text('tamanho da lista'),

        // TODO: Handle trailing button OnPressed
        trailing: IconButton(
          onPressed: () => print('trailing pressed'),
          icon: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
