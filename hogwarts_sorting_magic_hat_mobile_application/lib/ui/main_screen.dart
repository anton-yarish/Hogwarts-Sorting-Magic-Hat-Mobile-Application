// main_screen.dart
import 'package:flutter/material.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/providers/bottom_nav_provider.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/list_screen.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/home_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ListScreen(),
  ];

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: _widgetOptions.elementAt(bottomNavProvider.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
        currentIndex: bottomNavProvider.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: bottomNavProvider.selectIndex,
      ),
    );
  }
}
