import 'package:flutter/material.dart';
import 'jadwal.dart';
import 'notifikasi.dart';
import 'pesan.dart';
import 'elearning.dart';
import 'medsos.dart';

class SecondaryScreen extends StatefulWidget {
  final int iteration;
  SecondaryScreen({required this.iteration});

  @override
  _SecondaryScreenState createState() => _SecondaryScreenState();
}

class _SecondaryScreenState extends State<SecondaryScreen> {
  late int _selectedIndex; // Gunakan late karena akan diinisialisasi di initState

  final List<Widget> _pages = <Widget>[
    Medsos(),
    Elearning(),
    Jadwal(),
    Pesan(),
    Notifikasi(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.iteration; // Gunakan widget.iteration di dalam initState
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Medsos"),
          BottomNavigationBarItem(icon: Icon(Icons.light_mode), label: "Elearning"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Jadwal & Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Pesan & Group"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
        ],
      ),
    );
  }
}
