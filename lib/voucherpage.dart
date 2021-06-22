import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/contact.dart';
import 'package:second_project/homepage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/terms.dart';
import 'package:http/http.dart' as http;
import 'favouritepage.dart';
import 'main.dart';

class Voucherpage extends StatefulWidget {
  @override
  _VoucherpageState createState() => _VoucherpageState();
}

class _VoucherpageState extends State<Voucherpage> {
  List voucherList = [];
  var voucherDetails;

  @override
  void initState() {
    super.initState();
    fetchVoucher();
  }

  fetchVoucher() async {
    final response = await http.get(ipAddress8);
    setState(() {
      voucherDetails = json.decode(response.body);
    });

    print(voucherDetails);
    for (int i = 0; i < voucherDetails.length; i++)
      voucherList.add({
        'id': voucherDetails[i]["id"],
        'name': voucherDetails[i]["name"],
        'number': voucherDetails[i]["number"],
        'discount': voucherDetails[i]["discount"],
        'valid': voucherDetails[i]["valid"],
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Text(
            "Vouchers",
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
                                          color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Nooraiya khan",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black,fontWeight: FontWeight.w300),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpage()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(15),
                          //margin: EdgeInsets.only(right: 15),

                          child: Container(
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
                                      color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
                                builder: (context) => Cartpage()));
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
                                          color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 14,fontWeight: FontWeight.w300),
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
                                builder: (context) => Orderpage()));
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
                                          color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 14,fontWeight: FontWeight.w300),
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1)),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.category,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Vouchers",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "4",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300),
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
                                          color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "2",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Termspage()));
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                    ),
                         SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Contact Us",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
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
                                        style: TextStyle(fontWeight: FontWeight.w300,
                                            color: Colors.grey, fontSize: 15),
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
                                                  fontWeight: FontWeight.w300,
                                                    color: Colors.white,
                                                    fontSize: 15),
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
                                                  fontWeight: FontWeight.w300,
                                                    color: Colors.white,
                                                    fontSize: 15),
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: List.generate(voucherList.length, (index) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.1)),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${voucherList[index]["name"]}",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Voucher number:${voucherList[index]['number']}",
                            style: TextStyle(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.money,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                              child: Text(
                                "Discount:${voucherList[index]['discount']}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.blue,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                              child: Text(
                                "Valid:${voucherList[index]['valid']}",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        )));
  }
}
