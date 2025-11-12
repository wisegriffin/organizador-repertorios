import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/utils/validation.dart';
import 'package:organizador_repertorios/features/musics/data/repos/music_repo.dart';
import 'package:organizador_repertorios/features/musics/domain/contracts/imusic_repo.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/domain/repertory_music_service.dart';
import 'package:organizador_repertorios/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';
import 'package:organizador_repertorios/features/musics/presentation/views/widgets/music_item_view.dart';
import 'package:provider/provider.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage(this._repertory, {super.key});

  final Repertory _repertory;

  @override
  Widget build(BuildContext context) {
    final repertoryVM = context.read<RepertoryViewmodel>();
    final repertoryMusicService = context.read<RepertoryMusicService>();
    final musicRepo = context.read<MusicRepo>();

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
                repertoryMusicService: repertoryMusicService,
                musicRepo: musicRepo,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: repertoryMusicService.watchAllFromRepertory(_repertory),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) return Center(child: Text('No musics'));
          return ListView.builder(
            itemBuilder: (context, index) =>
                MusicItemView(asyncSnapshot.data!.elementAt(index), _repertory),
            itemCount: asyncSnapshot.data?.length,
          );
        },
      ),
    );
  }
}

void showCreateMusicDialog(
  BuildContext context, {
  required RepertoryViewmodel repertoryVM,
  required RepertoryMusicService repertoryMusicService,
  required Repertory repertory,
  required IMusicRepo musicRepo,
}) {
  // TODO: ADD FOCUS
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final keyController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
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
                    TextFormField(
                      controller: keyController,
                      decoration: InputDecoration(label: Text('Key')),
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
                        // Create music from form
                        musicRepo
                            .createMusic(
                              title: titleController.text.trim(),
                              author: authorController.text.trim(),
                              key: keyController.text.trim(),
                            )
                            .then(
                              // Add to the repertory
                              (value) => repertoryMusicService
                                  .addMusicToRepertory(repertory, value),
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
      );
    },
  );
}
