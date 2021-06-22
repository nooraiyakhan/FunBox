import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/favouritepage.dart';
import 'package:second_project/homepage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/terms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:second_project/voucherpage.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "Contact Us",
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image.asset("assets/profile.jpg"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Hello,",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Nooraiya khan",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mainpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cart",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orderpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.format_align_justify,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Orders",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addresspage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Voucherpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.category,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Vouchers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                    right: 15,
                                  ),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ))
                            ])),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavouritePage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Favourite",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Termspage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.security,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Terms and Conditions",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contact()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Contact Us",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                  title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      "Do you want to Log Out?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Loginpage()));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 18,
                                                right: 18,
                                                top: 6,
                                                bottom: 6),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 18,
                                                right: 18,
                                                top: 6,
                                                bottom: 6),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.power_settings_new,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                child: Image.asset("assets/contact.jpg",
                height: 200,
                width: MediaQuery.of(context).size.width,
                ),
              ),
              
             Text(
              "Phone number",style: TextStyle(
                color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 16
              ),
              
             ),
             SizedBox(height: 5,),
             Text(
               "01727437781",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300
               ),
             ),
            
          
     
        
              Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5)),
              Row(
                children: [
               //   Padding(padding: EdgeInsets.only(left: 20)),
                  GestureDetector(
                    onTap: () async {
                      await launch("tel:+8801722213828");
                    },
                    child: Card(
                      elevation: 2,
                      child:
                       Column(
                         children: [
                           Container(
                             height: 50,
                            width: 60,
                           // padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                            child: Icon(
                              Icons.phone,
                              color: Colors.blueGrey[800],
                              size: 30,
                            ),
                      
                      ),
                      Padding(
                        padding:EdgeInsets.only(bottom: 10),
                        child: Container(
                        child: Text(
                          "Phone",style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        ),
                      )
                         ],
                       ),
                      
                    ),
                  ),
                   GestureDetector(
                    onTap: () async {
                      await launch("sms:+8801722213828?body=hello Funbox!%20there");
                    },
                    child: Card(
                      elevation: 2,
                      child:
                       Column(
                         children: [
                           Container(
                             height: 50,
                            width: 60,
                           // padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                            child: Icon(
                              Icons.message,
                              color: Colors.blueGrey[800],
                              size: 30,
                            ),
                      
                      ),
                      Padding(
                        padding:EdgeInsets.only(bottom: 10),
                        child: Container(
                        child: Text(
                          "Message",style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        ),
                      )
                         ],
                       ),
                      
                    ),
                  ),
                         GestureDetector(
                    onTap: () async {
                     
                        await launch("https://wa.me/+8801722213828?text=Hello Funbox!");
                    },
                    child: Card(
                      elevation: 2,
                      child:
                       Column(
                         children: [
                           Container(
                             height: 50,
                            width: 60,
                           // padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                            child:     Image.asset(
                              "assets/whats.jpg",
                              height: 15,
                              width: 15,
                              fit: BoxFit.cover,
                        ),
                      
                      ),
                      Padding(
                        padding:EdgeInsets.only(bottom: 10,left: 5,right: 5),
                        child: Container(
                        child: Text(
                          "WhatsApp",style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        ),
                      )
                         ],
                       ),
                      
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                       await launch("mailto:nadvifunbox013@gmail.com?subject=Email&body=hello%20there");
                    },
                    child: Card(
                      elevation: 2,
                      child:
                       Column(
                         children: [
                           Container(
                             height: 50,
                            width: 60,
                           // padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                            child: Icon(
                              Icons.email,
                              color: Colors.blueGrey[800],
                              size: 30,
                            ),
                      
                      ),
                      Padding(
                        padding:EdgeInsets.only(bottom: 10),
                        child: Container(
                        child: Text(
                          "Gmail",style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        ),
                      )
                         ],
                       ),
                      
                    ),
                  ),
                
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
