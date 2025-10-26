import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organizador_repertorios/presentation/states/repertory_provider.dart';
import 'package:organizador_repertorios/presentation/widgets/repertory_list_item.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Repertories'),
      actions: [
        IconButton(
          onPressed: () => print('add repertory'),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepertoryProvider(),
      child: Builder(
        builder: (context) {
          final state = context.watch<RepertoryProvider>();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.repertories.length,
                  itemBuilder: (context, index) =>
                      RepertoryListItem(title: state.repertories[index]),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(15),
                child: IconButton.filled(
                  tooltip: 'Add',
                  onPressed: () =>
                      state.addRepertory(state.repertories.length.toString()),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
