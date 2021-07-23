import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialist;
  final String photo;
  final String review;
  final bool isOnline;
  DoctorCard(
      {Key? key,
      this.doctorName = "Dr. Bellamy N",
      this.specialist = "Viralogist",
      this.photo =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnLnP_dX6SiNEaqhA_MiXBlUAZSWEXRvds-A&usqp=CAU",
      this.review = "4.5 (135 reviews)",
      this.isOnline = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10000.0),
                    child: CachedNetworkImage(
                      imageUrl: photo,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                        "assets/placeholder.jpg",
                        fit: BoxFit.cover,
                        width: 72,
                        height: 72,
                      ),
                      width: 72,
                      height: 72,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                isOnline
                    ? Positioned(
                        right: 1,
                        top: 3,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
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
          Text(
            doctorName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Color(0xFF222B45),
                fontSize: 14,
                fontFamily: "Poppins-SemiBold"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              specialist,
              overflow: TextOverflow.ellipsis,
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
                Icon(
                  Icons.star,
                  size: 16,
                  color: Color(0xFFF7C480),
                ),
                Container(
                  width: 100,
                  child: Text(
                    review,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
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
