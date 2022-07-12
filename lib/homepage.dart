import 'package:flutter/material.dart';

import 'model.dart';
import 'network.dart';

class SetupProfilePost extends StatefulWidget {
  SetupProfilePost({Key? key}) : super(key: key);
  @override
  State<SetupProfilePost> createState() => _SetupProfilePostState();
}

class _SetupProfilePostState extends State<SetupProfilePost> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController gender = TextEditingController();
  bool validfirstname = false;
  bool validastname = false;
  bool validdegree = false;
  bool validgender = false;
  String errorfirstname = ' ';
  String errorlastname = '';
  String errordegree = '';
  String errorgender = '';
  SetupProfile? setupProfile;
  SetupProfileNetwork setupprofilenetwork = SetupProfileNetwork();
  @override
  void initState() {
    super.initState();

    validastname = validdegree = validfirstname = validgender = false;
    errorgender = errorlastname = errorfirstname = errordegree = '';
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.2, bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            height: height * 0.07,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                      errorText: validfirstname ? errorfirstname : null,
                      border: InputBorder.none,
                      hintText: ' Enter Your FirstName'),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            height: height * 0.07,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: lastname,
                  decoration: InputDecoration(
                      errorText: validastname ? errorlastname : null,
                      border: InputBorder.none,
                      hintText: ' Enter Your LastName'),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            height: height * 0.07,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: degree,
                  decoration: InputDecoration(
                      errorText: validdegree ? errordegree : null,
                      border: InputBorder.none,
                      hintText: ' Enter Your Degree'),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)),
            height: height * 0.07,
            width: width * 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: gender,
                  decoration: InputDecoration(
                      errorText: validgender ? errordegree : null,
                      border: InputBorder.none,
                      hintText: ' Enter Your Gender'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.07,
            width: width * 0.8,
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                  primary: Colors.blue),
              onPressed: () {
                setupprofilenetwork.setup(firstname.text, lastname.text, degree.text, gender.text);
                if (validation() == 0) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Success')));
                }
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    ));
  }

  int validation() {
    int cnt = 0;
    if (firstname.text.isEmpty) {
      setState(() {
        validfirstname = true;
        errorfirstname = 'please enter your firstname ';
        cnt++;
      });
    } else {
      setState(() {
        validfirstname = false;
        errorfirstname = ' ';
      });
    }
    if (lastname.text.isEmpty) {
      setState(() {
        validastname = true;
        errorlastname = 'please enter your lastname ';
        cnt++;
      });
    } else {
      setState(() {
        validastname = false;
        errorlastname = ' ';
      });
    }
    if (degree.text.isEmpty) {
      setState(() {
        validdegree = true;
        errordegree = 'please enter your degree ';
        cnt++;
      });
    } else {
      setState(() {
        validdegree = false;
        errordegree = ' ';
      });
    }
    if (gender.text.isEmpty) {
      setState(() {
        validgender = true;
        errorgender = 'please enter your gender ';
        cnt++;
      });
    } else {
      setState(() {
        validgender = false;
        errorgender = ' ';
      });
    }
    return cnt;
  }
}
