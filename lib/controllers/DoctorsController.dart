import 'dart:convert';

import 'package:doctor_appointments/models/doctors.dart';
import 'package:flutter/services.dart';

class DoctorController {
  static Future<List<DoctorsModel>> getAllDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final data = await json.decode(response);
    List<DoctorsModel> listDoctors = [];
    for (var doctor in data['doctors']) {
      DoctorsModel data = DoctorsModel(
          name: doctor['name'],
          specialist: doctor['specialist'],
          about: doctor['about'],
          isOnline: doctor['isOnline'],
          patients: doctor['patients'],
          photo: doctor['photo'],
          rating: doctor['rating'],
          reviews: doctor['reviews'],
          workingTime: doctor['workingTime'],
          experience: doctor['experience']);
      listDoctors.add(data);
    }
    return listDoctors;
  }
}
