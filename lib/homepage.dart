import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'loginpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List welcomeItem = [
    {
      'picture': 'assets/variety.jpg',
      'title': 'Variety of Products',
      'desc': 'you will find mobile,tablet,laptop,wristwatch just in a place.'
    },
    {
      'picture': 'assets/onlineshopping.jpg',
      'title': 'Online Shopping',
      'desc':
          'If you want to buy laptop,mobile,wristwatch just by being home you are on the right place.Happy shopping!'
    },
    {
      'picture': 'assets/homedelivery.png',
      'title': 'Home Delivery',
      'desc': 'we will give home delivery in any place of sylhet.you have to pay  only 25% before delivery '
    },
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: <Widget>[
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Image.asset(
                            "${welcomeItem[index]['picture']}",
                            height: 250,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "${welcomeItem[index]['title']}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
                          child: Text(
                            "${welcomeItem[index]['desc']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 80),
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: index == 2
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              index == 2
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Loginpage()));
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: 100,
                                        height: 30,
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w300
                                          ),
                                        ),
                                      ),
                                    ),
                              index == 2
                                  ? Container()
                                  : Container(
                                      child: Row(children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: index == 0
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: index == 1
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                              color: index == 2
                                                  ? Colors.blue
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        )
                                      ]),
                                    ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (index == 0) {
                                      index = 1;
                                    } else if (index == 1) {
                                      index = 2;
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Loginpage()));
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: index == 2
                                      ? BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(10))
                                      : BoxDecoration(),
                                  alignment: index == 2
                                      ? Alignment.center
                                      : Alignment.centerRight,
                                  width: index == 2 ? 200 : 100,
                                  height: index == 2 ? 40 : 30,
                                  child: Text(
                                    index == 0 || index == 1
                                        ? "Next"
                                        : "Get Started >",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: index == 2
                                          ? Colors.white
                                          : Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  )
                ]))));
  }
}
