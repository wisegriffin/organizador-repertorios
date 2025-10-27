import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organizador_repertorios/viewmodel/lists_page_viewmodel.dart';
import 'package:organizador_repertorios/view/widgets/repertory_list_item.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = ListsPageViewModel();
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: _ListsPage(),
    );
  }
}

class _ListsPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<ListsPageViewModel>();
    return Stack(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: viewmodel.repertories.length,
            itemBuilder: (context, index) =>
                RepertoryListItem(title: viewmodel.repertories[index]),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(15),
          child: IconButton.filled(
            tooltip: 'Add',
            onPressed: () =>
                viewmodel.addRepertory(viewmodel.repertories.length.toString()),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
