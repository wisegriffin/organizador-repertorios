import 'package:flutter/material.dart';
import 'package:organizador_repertorios/presentation/pages/lists_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _destinations = [ListsPage(), Placeholder()];

  void _navigateToSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Bar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _destinations[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _navigateToSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
      floatingActionButton:
          _selectedIndex == _destinations.indexOf(_destinations.first)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => print('pressed'),
            )
          : null,
    );
  }
}
