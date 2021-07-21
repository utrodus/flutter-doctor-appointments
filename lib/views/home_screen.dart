import 'package:doctor_appointments/views/components/doctor_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(27, 30, 27, 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Welcome Utrodus,",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Text(
                  "Find your doctor",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins-SemiBold",
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color(0xff6B779A), fontSize: 14),
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Search For Doctor"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                    color: Color(0xFF3E64FF),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF3E64FF).withOpacity(0.3),
                        offset: const Offset(
                          0.0,
                          15.0,
                        ),
                        blurRadius: 25.0,
                        spreadRadius: 0.5,
                      ),
                    ]),
                child: Stack(
                  children: [
                    Text(
                      "Covid-19 Healthcare",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Poppins-SemiBold",
                          color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Text(
                        "Book your next online appointments",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins-SemiBold",
                            color: Colors.white),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: SvgPicture.asset("assets/svg/doctors.svg"))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Doctor",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Poppins-Bold",
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () => {},
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins-Medium",
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DoctorCard(
                      doctorName: "Dr Utrodus",
                    ),
                    DoctorCard(),
                    DoctorCard()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
