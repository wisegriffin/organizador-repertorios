import 'package:flutter/material.dart';

void showChildSizedBottomSheet({required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) => ConstrainedBox(
      constraints: BoxConstraints(),
      child: IntrinsicHeight(child: child)
    ),
  );
}
