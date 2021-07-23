import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class BadgeDoctor extends StatelessWidget {
  final String label;
  final String value;
  final int color;
  final IconData icon;

  BadgeDoctor(
      {Key? key,
      this.label = "Patients",
      this.value = "1000",
      this.color = 0xff7ACEFA,
      this.icon = EvaIcons.person})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            padding: EdgeInsets.fromLTRB(12, 30, 12, 8),
            decoration: BoxDecoration(
              color: Color(color).withOpacity(0.15),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Icon(
              icon,
              size: 30,
              color: Color(color),
            ),
          ),
          Text(value,
              style: TextStyle(
                  color: Color(0xff222B45), fontFamily: "Poppins-Bold")),
          Text(label,
              style: TextStyle(
                  color: Color(0xff6B779A), fontFamily: "Poppins-SemiBold"))
        ],
      ),
    );
  }
}
