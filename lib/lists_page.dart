import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  var repertories = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: ListView(children: [
        
      ],
    )),
        ElevatedButton(
          onPressed: () => print('pressed'),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
