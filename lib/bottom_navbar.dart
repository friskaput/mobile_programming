import 'package:flutter/material.dart';
import 'pages/ListJadwalPage.dart';
import 'pages/DashboardPage.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex; // Indeks halaman aktif
  const BottomNavBar({super.key, required this.currentIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex, // Menentukan halaman aktif
      onTap: (index) {
        // Navigasi ke halaman sesuai indeks
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListJadwalPage()),
            );
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ''
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple, // Warna ikon aktif
      unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}