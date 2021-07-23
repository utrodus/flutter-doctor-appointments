import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_appointments/models/doctors.dart';
import 'package:doctor_appointments/views/components/badge.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class DetailDoctorScreen extends StatelessWidget {
  final DoctorsModel doctor;
  DetailDoctorScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFC),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 35),
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xff222B45),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10000.0),
                      child: CachedNetworkImage(
                        imageUrl: doctor.photo ?? "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Image.asset(
                          "assets/placeholder.jpg",
                          fit: BoxFit.cover,
                          width: 110,
                          height: 110,
                        ),
                        width: 110,
                        height: 110,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                  doctor.isOnline ?? false
                      ? Positioned(
                          top: 1,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(70, 3, 0, 0),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                color: Color(0xff3E64FF),
                                shape: BoxShape.circle),
                          ),
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 3),
              alignment: Alignment.center,
              child: Text(
                doctor.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF222B45),
                    fontSize: 20,
                    fontFamily: "Poppins-SemiBold"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                doctor.specialist ?? "",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontSize: 15,
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 27, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BadgeDoctor(
                    color: 0xff7ACEFA,
                    icon: EvaIcons.peopleOutline,
                    label: "Patients",
                    value: doctor.patients ?? "",
                  ),
                  BadgeDoctor(
                      color: 0xffE8899E,
                      icon: EvaIcons.awardOutline,
                      label: "Experience",
                      value: doctor.experience ?? ""),
                  BadgeDoctor(
                    color: 0xffF7C480,
                    icon: EvaIcons.starOutline,
                    label: "Ratings",
                    value: doctor.rating ?? "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
