import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/musics/domain/entities/music.dart';
import 'package:organizador_repertorios/features/musics/presentation/viewmodels/music_viewmodel.dart';
import 'package:organizador_repertorios/core/widgets/discard_changes_alert.dart';
import 'package:provider/provider.dart';

enum AcessMode { view, edit }

class MusicContentView extends StatefulWidget {
  const MusicContentView(
    this._music, {
    this.acessMode = AcessMode.view,
    super.key,
  });

  final Music _music;
  final AcessMode acessMode;

  @override
  State<MusicContentView> createState() => _MusicContentViewState();
}

class _MusicContentViewState extends State<MusicContentView> {
  late final Music music;
  late final Music initialMusic;

  final formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController authorController;
  late final TextEditingController keyController;
  late final TextEditingController contentController;

  late AcessMode acessMode;

  @override
  void initState() {
    super.initState();
    music = widget._music;
    acessMode = widget.acessMode;
    initialMusic = music.copy();

    titleController = TextEditingController(text: music.title);
    authorController = TextEditingController(text: music.author);
    keyController = TextEditingController(text: music.key);
    contentController = TextEditingController(text: music.content);
  }

  @override
  Widget build(BuildContext context) {
    final musicVM = context.watch<MusicViewmodel>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        if (!hasChanges()) {
          Navigator.of(context).pop();
          return;
        }

        // Show discard alert
        late final bool discard;
        discard = await showDiscardChangesAlert(context);

        if (!context.mounted) return;

        if (discard) {
          Navigator.of(context).pop();
        }
      },

      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: acessMode == AcessMode.edit
              ? Text('Edit mode', style: TextStyle(fontStyle: FontStyle.italic))
              : null,
          actions: acessMode == AcessMode.view
              // View mode actions
              ? [
                  // Edit button
                  IconButton(
                    tooltip: 'Edit',
                    onPressed: () => setState(() {
                      acessMode = AcessMode.edit;
                    }),
                    icon: Icon(Icons.edit_outlined),
                  ),
                ]
              // Edit mode actions
              : [
                  // Cancel button
                  IconButton(
                    tooltip: 'Cancel',
                    onPressed: () => setState(() {
                      final music = widget._music;
                      acessMode = AcessMode.view;

                      titleController.text = music.title;
                      authorController.text = music.author;
                      keyController.text = music.key!;
                      contentController.text = music.content!;

                      FocusScope.of(context).unfocus();
                    }),
                    icon: Icon(Icons.cancel_outlined),
                  ),

                  // Save button
                  IconButton(
                    tooltip: 'Save',
                    onPressed: () => setState(() {
                      musicVM.updateMusic(
                        widget._music.id,
                        title: titleController.text.trim(),
                        author: authorController.text.trim(),
                        key: keyController.text.trim(),
                        content: contentController.text,
                      );
                      acessMode = AcessMode.view;
                      FocusScope.of(context).unfocus();
                    }),
                    icon: Icon(Icons.save),
                  ),
                ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IgnorePointer(
              ignoring: acessMode == AcessMode.view,

              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title field
                    TextFormField(
                      controller: titleController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      decoration: InputDecoration(hintText: 'Title'),
                    ),

                    // Author field
                    TextFormField(
                      controller: authorController,
                      decoration: InputDecoration(hintText: 'Author'),
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),

                    // Key field
                    if (widget._music.key != null)
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Key: '),
                          controller: keyController,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),

                    // Content field
                    SizedBox(height: 30),
                    if (widget._music.content != null)
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: contentController,
                        decoration: InputDecoration(
                          hintText: 'No content yet',
                          border: InputBorder.none,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool hasChanges() {
    return titleController.text != initialMusic.title ||
        authorController.text != initialMusic.author ||
        contentController.text != initialMusic.content ||
        keyController.text != initialMusic.key;
  }
}
