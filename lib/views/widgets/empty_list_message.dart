import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Empty. Try adding repertories',
        style: TextStyle(color: Theme.of(context).colorScheme.outlineVariant),
      ),
    );
  }
}
