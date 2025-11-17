import 'package:flutter/material.dart';
import 'package:organizador_repertorios/core/theme/theme_controller.dart';
import 'main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.themeMode,
      builder: (context, mode, child) {

        return MaterialApp(
          title: 'Hymnum',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: mode,
          home: MainPage(),
        );
        
      },
    );
  }
}
