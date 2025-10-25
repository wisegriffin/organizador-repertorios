import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  var repertories = ['Congregacionais', 'Palavrantiga', 'Stênio Marcius'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // List of all repertories
        Expanded(
          child: ListView.builder(
            itemCount: repertories.length,
            itemBuilder: (context, index) =>
                _Repertory(title: repertories[index]),
          ),
        ),

        // TODO: A button in the bottom right to add repertories
        ElevatedButton(
          child: Icon(Icons.add),
          onPressed: () => print('pressed'),
        ),
      ],
    );
  }
}

class _Repertory extends StatelessWidget {
  const _Repertory({required this.title});

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
