import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/theme/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ThemeController.toggleTheme();
        },
        child: Text('Toggle theme'),
      ),
    );
  }
}
