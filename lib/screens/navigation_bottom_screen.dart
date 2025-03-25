import 'package:flutter/material.dart';

class NavigationBottomScreen extends StatefulWidget {
  const NavigationBottomScreen({super.key});

  @override
  State<NavigationBottomScreen> createState() => _NavigationBottomScreenState();
}

class _NavigationBottomScreenState extends State<NavigationBottomScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Center(
    child: Text(
      'Selected Tab: ${['Home', 'History', 'Social', 'Profile'][_selectedIndex]}',
      style: TextStyle(fontSize: 20),
    ),
  ),
  bottomNavigationBar: Container(
    height: 90, // Set height to 100px
    color: Colors.white,
    child: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Social'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color.fromARGB(255, 28, 106, 34),
      iconSize: 40,
      selectedLabelStyle: TextStyle(fontSize: 15),
      unselectedLabelStyle: TextStyle(fontSize: 15),
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white, // Keep this transparent for Container color to apply
    ),
  ),
);

  }
}
