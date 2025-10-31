import 'package:flutter/material.dart';
import 'package:organizador_repertorios/models/repertory.dart';
import 'package:organizador_repertorios/viewmodels/lists_page_viewmodel.dart';
import 'package:provider/provider.dart';

void showRenameRepertoryBottomSheet(
  Repertory? repertory, {
  required BuildContext context,
}) {
  final viewmodel = Provider.of<ListsPageViewModel>(context, listen: false);
  String name = repertory == null ? '' : repertory.name;
  final textController = TextEditingController.fromValue(
    TextEditingValue(text: name),
  );

  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.viewInsetsOf(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (value) => name = value,
                decoration: InputDecoration(label: Text('Name')),
                controller: textController,
                autofocus: true,
                maxLength: 50,
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                OutlinedButton(
                  onPressed: () {
                    if (repertory == null) {
                      viewmodel.addRepertory(name);
                    } else {
                      viewmodel.renameRepertory(repertory, name);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
