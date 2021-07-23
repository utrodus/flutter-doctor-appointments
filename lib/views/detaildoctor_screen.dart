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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 35),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
              decoration: BoxDecoration(color: Color(0xffFAFAFC)),
              child: Row(
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
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                color: Color(0xffFAFAFC),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
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
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )),
                        doctor.isOnline ?? false
                            ? Positioned(
                                top: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(70, 3, 0, 0),
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
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
            Container(
              margin: EdgeInsets.fromLTRB(25, 30, 25, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "About Doctor",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff222B45),
                    fontSize: 18,
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              alignment: Alignment.center,
              child: Text(
                doctor.about ?? "",
                overflow: TextOverflow.visible,
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontSize: 15,
                    fontFamily: "Poppins-Medium"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 18, 25, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "Working time",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff222B45),
                    fontSize: 18,
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 8, 25, 10),
              alignment: Alignment.topLeft,
              child: Text(
                doctor.workingTime ?? "",
                overflow: TextOverflow.visible,
                style: TextStyle(
                    color: Color(0xff6B779A),
                    fontSize: 15,
                    fontFamily: "Poppins-Medium"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 18, 25, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "Communication",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xff222B45),
                    fontSize: 18,
                    fontFamily: "Poppins-Bold"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 13, 25, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color(0xffE8899E).withOpacity(0.15)),
                          child: Icon(
                            EvaIcons.messageCircle,
                            color: Color(0xffE8899E),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Messaging",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff222B45),
                                fontSize: 15,
                                fontFamily: "Poppins-SemiBold"),
                          ),
                          Text(
                            "Chat me up, share photo",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff6B779A),
                                fontSize: 13,
                                fontFamily: "Poppins-SemiBold"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color(0xff7ACEFA).withOpacity(0.15)),
                            child: Icon(
                              EvaIcons.phone,
                              color: Color(0xff7ACEFA),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Audio Call",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff222B45),
                                  fontSize: 15,
                                  fontFamily: "Poppins-SemiBold"),
                            ),
                            Text(
                              "Call your doctor directly.",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff6B779A),
                                  fontSize: 13,
                                  fontFamily: "Poppins-SemiBold"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color(0xffF7C480).withOpacity(0.15)),
                            child: Icon(
                              EvaIcons.messageCircle,
                              color: Color(0xffF7C480),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Video Call",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff222B45),
                                  fontSize: 15,
                                  fontFamily: "Poppins-SemiBold"),
                            ),
                            Text(
                              "See your doctor live.",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff6B779A),
                                  fontSize: 13,
                                  fontFamily: "Poppins-SemiBold"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
