import 'package:flutter/material.dart';
import 'view/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hymnum',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: MainPage(),
    );
  }
}