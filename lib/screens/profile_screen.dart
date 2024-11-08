import 'package:flutter/material.dart';
import 'package:kuispam_124210022/screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profil Pengguna'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
              SizedBox(height: 20),
              Text('Nama: Ridho Contrisha'),
              Text('NIM: 124210022'),
              Text('Tempat, Tanggal Lahir: Tangerang, 27 Juni 2003'),
              Text('Hobi: Mobile Legend'),
            ],
          ),
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
}
