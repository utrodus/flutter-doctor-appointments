import 'package:flutter/material.dart';

class AllDoctorsScreen extends StatefulWidget {
  AllDoctorsScreen({Key? key}) : super(key: key);

  @override
  _AllDoctorsScreenState createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController searchTextController = TextEditingController(text: "");

  @override
  void initState() {
    searchTextController = TextEditingController(text: "");
    super.initState();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
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
          child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(27, 15, 27, 35),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextField(
                controller: searchTextController,
                maxLines: 1,
                style: TextStyle(fontSize: 14, color: Colors.black),
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
          ],
        ),
      )),
    );
  }
}
