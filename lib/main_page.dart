import 'package:flutter/material.dart';
import 'package:organizador_repertorios/features/repertory/presentation/views/pages/repertories_page.dart';
import 'package:organizador_repertorios/features/settings_page/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _destinations = [RepertoriesPage(), SettingsPage()];

  void _navigateToSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = _destinations[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hymnum'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: currentPage,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _navigateToSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.queue_music), label: 'home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
    );
  }
}
