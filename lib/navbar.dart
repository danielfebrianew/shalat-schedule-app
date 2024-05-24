import 'package:flutter/material.dart';
import 'package:jadwal_sholat/page/conversionpage.dart';
import 'package:jadwal_sholat/page/homepage.dart';
import 'package:jadwal_sholat/page/profilepage.dart';
import 'package:jadwal_sholat/page/timepage.dart';
// import 'package:jadwal_sholat/page/search.dart';
import 'package:jadwal_sholat/page/userpage.dart';

const mainColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);
const textColor = Colors.white;

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  List pages = [
    const Homepage(),
    const UserListPage(),
    const CurrencyConversionPage(),
    const TimeConversionPage(),
    const ProfilePage(),
  ];

  void _onTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'List User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Mata Uang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Waktu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: const Color.fromARGB(255, 159, 155, 149),
        showUnselectedLabels: true,
        selectedItemColor: fillColor,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        backgroundColor: mainColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
