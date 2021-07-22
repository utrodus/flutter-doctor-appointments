import 'package:doctor_appointments/controllers/DoctorsController.dart';
import 'package:flutter/material.dart';

import 'components/doctor_cart.dart';

class AllDoctorsScreen extends StatefulWidget {
  AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  _AllDoctorsScreenState createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController searchTextController = TextEditingController(text: "");

  // list doctors
  List doctors = [];

  @override
  void initState() {
    getDoctorData();
    searchTextController = TextEditingController(text: "");
    super.initState();
  }

  getDoctorData() {
    Future<List<dynamic>> getDoctor = DoctorController.getAllDoctors();
    getDoctor.then((value) => {
          setState(() {
            doctors = value;
          })
        });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffFAFAFA),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0xff222B45),
        ),
        title: Text(
          "All Doctors",
          style: TextStyle(
              color: Color(0xff222B45),
              fontFamily: "Poppins-SemiBold",
              fontSize: 16),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(27, 15, 27, 25),
            child: TextField(
              controller: searchTextController,
              maxLines: 1,
              style: TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  hintStyle: TextStyle(color: Color(0xff6B779A), fontSize: 14),
                  suffixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Search For Doctor"),
            ),
          ),
          doctors.length > 0
              ? Container(
                  width: double.infinity,
                  child: Center(
                    child: GridView.builder(
                      padding: EdgeInsets.fromLTRB(35, 15, 27, 35),
                      addAutomaticKeepAlives: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 3
                              : 2,
                          mainAxisSpacing: 18,
                          childAspectRatio: 0.85),
                      shrinkWrap: true,
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: DoctorCard(
                            doctorName: doctors[index]["name"],
                            photo: doctors[index]["photo"],
                            specialist: doctors[index]['specialist'],
                            review: doctors[index]['reviews'],
                            isOnline: doctors[index]['isOnline'],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Container()
        ],
      )),
    );
  }
}
