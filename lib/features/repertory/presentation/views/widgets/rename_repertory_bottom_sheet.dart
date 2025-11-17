import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/utils/validation.dart';
import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';
import 'package:organizador_repertorios/features/repertory/presentation/viewmodels/repertory_viewmodel.dart';
import 'package:provider/provider.dart';

void showRenameRepertoryBottomSheet(
  Repertory? repertory, {
  required BuildContext context,
}) {
  final viewmodel = Provider.of<RepertoryViewmodel>(context, listen: false);
  String name = repertory == null ? '' : repertory.name;
  final textController = TextEditingController.fromValue(
    TextEditingValue(text: name),
  );
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: Durations.short2,
      child: _BottomSheetContent(
        textController: textController,
        repertoryViewmodel: viewmodel,
        repertory: repertory,
        formKey: formKey,
      ),
    ),
  );
}

class _BottomSheetContent extends StatefulWidget {
  const _BottomSheetContent({
    required this.textController,
    required this.repertoryViewmodel,
    required this.repertory,
    required this.formKey,
  });

  final Repertory? repertory;
  final RepertoryViewmodel repertoryViewmodel;
  final TextEditingController textController;
  final GlobalKey<FormState> formKey;

  @override
  State<_BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<_BottomSheetContent> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => focusNode.requestFocus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: widget.formKey,
              child: TextFormField(
                focusNode: focusNode,
                validator: (value) =>
                    validateTextNotEmpty(value, 'Type the name'),
                decoration: InputDecoration(label: Text('Name')),
                controller: widget.textController,
                maxLength: 50,
                keyboardType: TextInputType.text,
              ),
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
                  if (!widget.formKey.currentState!.validate()) return;
                  if (widget.repertory == null) {
                    widget.repertoryViewmodel.addRepertory(
                      widget.textController.text.trim(),
                    );
                  } else {
                    widget.repertoryViewmodel.renameRepertory(
                      widget.repertory!,
                      widget.textController.text.trim(),
                    );
                  }
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
