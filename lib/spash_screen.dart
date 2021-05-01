import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second_project/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadTimer(); //to call timer function
  }

  Future<Timer> loadTimer() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Shop",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                //SizedBox(width:5),

                Text(
                  "ify",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
            height: 10,
          ),
          Container(
            width: 50,
            height: 2,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5)),
          ),
        ],
      ))),
      // bottomNavigationBar: Container(
      //       margin: EdgeInsets.only(bottom:20),
      //       child: Text(
      //         "We believe in customer's satisfaction",
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //             fontSize: 12,
      //             color: Colors.black54,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
    );
  }
}
