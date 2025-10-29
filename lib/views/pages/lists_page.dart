import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:organizador_repertorios/views/widgets/repertory_list_item.dart';
import 'package:organizador_repertorios/views/widgets/empty_list_message.dart';

class ListsPage extends StatelessWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<ListsPageViewModel>();
    return Stack(
      children: [
        SizedBox.expand(
          child: viewmodel.repertories.isNotEmpty
              ? ListView.builder(
                  itemCount: viewmodel.repertories.length,
                  itemBuilder: (context, index) =>
                      RepertoryListItem(viewmodel.getRepertoryByIndex(index)!),
                )
              : SizedBox.shrink(),
        ),
        if (viewmodel.repertories.isEmpty) EmptyListMessage(),
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