import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onItemTapped;

  BottomNavigation(this.onItemTapped);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
