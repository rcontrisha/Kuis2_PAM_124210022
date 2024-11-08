import 'package:flutter/material.dart';

class PiramidaScreen extends StatefulWidget {
  @override
  _PiramidaScreenState createState() => _PiramidaScreenState();
}

class _PiramidaScreenState extends State<PiramidaScreen> {
  final _sisiController = TextEditingController();
  final _tinggiController = TextEditingController();

  double volume = 0.0;
  double keliling = 0.0;

  void _calculate() {
    final sisi = double.tryParse(_sisiController.text) ?? 0.0;
    final tinggi = double.tryParse(_tinggiController.text) ?? 0.0;

    setState(() {
      volume = (1 / 3) * (sisi * sisi * tinggi); // Formula volume piramida
      keliling = 4 * sisi; // Formula keliling piramida
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piramida (Volume dan Keliling)'),
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sisi Alas'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi Piramida'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text('Volume: $volume'),
            Text('Keliling: $keliling'),
          ],
        ),
      ),
    );
  }
}
