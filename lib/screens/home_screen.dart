import 'package:flutter/material.dart';
import 'package:kuispam_124210022/screens/profile_screen.dart';
import 'piramida_screen.dart';
import 'konversi_waktu_screen.dart';
import 'cek_hari_screen.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PiramidaScreen(),
    KonversiWaktuScreen(),
    CekHariScreen(),
  ];

  final List<String> _menuTitles = [
    'Piramida (Volume dan Keliling)',
    'Konversi Waktu (WIB, WITA, WIT)',
    'Cek Hari (Senin - Minggu)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Bangun Datar'),
        ),
        body: ListView.builder(
          itemCount: _menuTitles.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _screens[index]),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          _menuTitles[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]));
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
