import 'package:flutter/material.dart';
import 'package:doctor_appointments/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointments',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins-Regular"),
      home: HomeScreen(),
    );
  }
}
