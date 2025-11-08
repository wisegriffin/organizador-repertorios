import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/utils/validation.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/widgets/music_item_view.dart';
import 'package:provider/provider.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    final repertoryVM = context.watch<RepertoryViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(_repertory.name),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 10,
        shape: BoxBorder.all(),
        actions: [
          // ADD MUSIC BUTTON
          IconButton(
            padding: EdgeInsets.only(right: 25),
            tooltip: 'add music',
            onPressed: () {
              showCreateMusicDialog(
                context,
                repertory: _repertory,
                repertoryVM: repertoryVM,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            MusicItemView(_repertory.musics[index]),
        itemCount: _repertory.musics.length,
      ),
    );
  }
}

void showCreateMusicDialog(
  BuildContext context, {
  required RepertoryViewmodel repertoryVM,
  required Repertory repertory,
}) {
  // TODO: ADD FOCUS
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: BoxBorder.all(),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        validateTextNotEmpty(value, 'Type the title'),
                    controller: titleController,
                    decoration: InputDecoration(label: Text('Title')),
                  ),
                  TextFormField(
                    controller: authorController,
                    decoration: InputDecoration(label: Text('Author')),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CANCEL BUTTON
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),

                // SAVE BUTTON
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      repertoryVM.addMusic(
                        repertory,
                        Music(id: 0, title: titleController.text.trim()),
                      );
                      Navigator.pop(context);
                    }
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
