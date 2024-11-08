import 'package:flutter/material.dart';

class CekHariScreen extends StatefulWidget {
  @override
  _CekHariScreenState createState() => _CekHariScreenState();
}

class _CekHariScreenState extends State<CekHariScreen> {
  final _nomorController = TextEditingController();
  String hari = '';

  void _cekHari() {
    final nomor = int.tryParse(_nomorController.text) ?? 0;
    setState(() {
      switch (nomor) {
        case 1:
          hari = 'Senin';
          break;
        case 2:
          hari = 'Selasa';
          break;
        case 3:
          hari = 'Rabu';
          break;
        case 4:
          hari = 'Kamis';
          break;
        case 5:
          hari = 'Jumat';
          break;
        case 6:
          hari = 'Sabtu';
          break;
        case 7:
          hari = 'Minggu';
          break;
        default:
          hari = 'Nomor tidak valid';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Hari'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Nomor Hari'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cekHari,
              child: Text('Cek Hari'),
            ),
            SizedBox(height: 20),
            Text('Hari: $hari'),
          ],
        ),
      ),
    );
  }
}
