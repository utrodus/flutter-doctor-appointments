import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
      width: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnLnP_dX6SiNEaqhA_MiXBlUAZSWEXRvds-A&usqp=CAU'),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            "Dr. Bellamy N",
            style: TextStyle(
                color: Color(0xFF222B45),
                fontSize: 14,
                fontFamily: "Poppins-SemiBold"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "Viralogist",
              style: TextStyle(
                  color: Color(0xff6B779A),
                  fontSize: 13,
                  fontFamily: "Poppins-Bold"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.star,
                    size: 16,
                  ),
                ),
                Text(
                  "4.5 (135 reviews)",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
