import 'package:flutter/material.dart';
import 'package:organizador_repertorios/lists_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO implement
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = ListsPage();
        break;

      case 1:
        page = Placeholder();
        break;

      default:
        throw UnimplementedError('No page assigned to this index.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My App Bar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: page,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('pressed'),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
    );
  }
}
