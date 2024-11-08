import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiWaktuScreen extends StatefulWidget {
  @override
  _KonversiWaktuScreenState createState() => _KonversiWaktuScreenState();
}

class _KonversiWaktuScreenState extends State<KonversiWaktuScreen> {
  int _currentIndex = 1;

  late DateTime _currentTime;
  DateTime _selectedTime = DateTime.now();
  String _selectedTimeZone = 'GMT';

  String _formatTime(DateTime time, String timeZone) {
    String runningTime =
        DateFormat('HH:mm:ss', 'en_US').format(time.toUtc()).toString();

    String amPmTime =
        DateFormat('h:mm a', 'en_US').format(time.toUtc()).toString();

    return '$runningTime\n$amPmTime $timeZone';
  }

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    // Timer to update the current time every second
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });

    // Timer to update _selectedTime based on the selected time zone
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_selectedTimeZone == 'GMT') {
          _selectedTime = _currentTime;
        } else if (_selectedTimeZone == 'WIB') {
          _selectedTime = _currentTime.toUtc().add(Duration(hours: 7));
        } else if (_selectedTimeZone == 'WITA') {
          _selectedTime = _currentTime.toUtc().add(Duration(hours: 8));
        } else if (_selectedTimeZone == 'WIT') {
          _selectedTime = _currentTime.toUtc().add(Duration(hours: 9));
        } else if (_selectedTimeZone == 'London') {
          _selectedTime = _currentTime.toUtc();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 400,
          width: 400,
          child: Card(
            color:
                Colors.grey[500], // Dark card color, darker than the background
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Waktu Sekarang:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        _formatTime(_selectedTime, _selectedTimeZone)
                            .split('\n')[0],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        _formatTime(_selectedTime, _selectedTimeZone)
                            .split('\n')[1],
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  color: Colors.grey[600],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      value: _selectedTimeZone,
                      onChanged: (String? value) {
                        setState(() {
                          if (value == 'WIB') {
                            _selectedTime =
                                _currentTime.toUtc().add(Duration(hours: 7));
                          } else if (value == 'WITA') {
                            _selectedTime =
                                _currentTime.toUtc().add(Duration(hours: 8));
                          } else if (value == 'WIT') {
                            _selectedTime =
                                _currentTime.toUtc().add(Duration(hours: 9));
                          }
                          _selectedTimeZone = value!;
                        });
                      },
                      items: ['GMT', 'WIB', 'WITA', 'WIT']
                          .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ).toList(),
                      style: TextStyle(color: Colors.white),
                      dropdownColor: Colors.grey[700],
                      iconEnabledColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
