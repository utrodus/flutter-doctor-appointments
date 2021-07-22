import 'dart:convert';

import 'package:flutter/services.dart';

class DoctorController {
  static Future<List> getAllDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final data = await json.decode(response);
    List items = data['doctors'];
    return items;
  }
}
