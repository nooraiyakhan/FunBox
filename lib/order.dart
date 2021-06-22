import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/contact.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/orderdetails.dart';
import 'package:second_project/purchagepage.dart';
import 'package:second_project/terms.dart';
import 'package:second_project/voucherpage.dart';
import 'package:http/http.dart' as http;
import 'favouritepage.dart';

class Orderpage extends StatefulWidget {
  
  @override
  _OrderpageState createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  List orderList = [];
var orderDetails;
  //final orderDetails;
  int index = 0;
  @override
  void initState(){
    super.initState();
    fetchOrder();
  }
  fetchOrder()async{
   final response =
        await http.get(ipAddress6);
    setState(() {
      orderDetails=json.decode(response.body);
    });
    print(orderDetails);
    for(int i=0;i<orderDetails.length;i++){
      double rat = double.parse(orderDetails[i]["rating"]);
      orderList.add(
        {
         'id': orderDetails[i]["id"],
          'pic': orderDetails[i]["pic"],
          'name': orderDetails[i]["name"],
          'price': orderDetails[i]["price"],
          
          'size': orderDetails[i]["size"],
          'camera': orderDetails[i]["camera"],
          'ram': orderDetails[i]["ram"],
          'battery': orderDetails[i]["battery"],
          'rating': rat,
          'status': orderDetails[i]["status"],
         
        }
      );
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          
          title: Text(
            "Orders",
            style: TextStyle(
                color: Colors.grey,
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
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mainpage()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(left: 15),
                      //  color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Home",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
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
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(right: 15),
                      //  decoration: BoxDecoration(
                         //   color: Colors.blue),
                        // borderRadius: BorderRadius.only(
                        // topRight: Radius.circular(25),
                        // bottomRight: Radius.circular(25))),
                        // padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cartpage()));
                            },
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cart",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Orderpage()));
                            },
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.format_align_justify,
                                    color: Colors.blue,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Orders",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
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
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Address",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
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
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.category,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Vouchers",
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text("4",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),),
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
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300), )],)),   ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Termspage())
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.security,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Terms and Conditions",
                              style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
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
                  InkWell(
                    onTap: (){
                      
                     showDialog(context: context,
                     builder: (BuildContext context) => AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          child: Text("Do you want to Log Out?",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                        ),
                        SizedBox(height: 20,),
                        Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>Loginpage())
                                
                                );

                              },
                             
                                child: Container(
                                  padding: EdgeInsets.only(left: 18,right: 18,top: 6,bottom: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                                ),
                              ),
                           
                            SizedBox(width: 15,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 18,right: 18,top: 6,bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,borderRadius: BorderRadius.circular(5)
                                ),
                                child: Text("No",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                            ),
                          ],
                        ),
                          )
                      ],)
                     ));
                    
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
                              style: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    children: List.generate(orderList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Orderdetailspage()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 5, bottom: 5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "${orderList[index]['pic'] }",
                          
                            // "${itemList[index]['pic']}",
                            height: 100,
                            width: 80,
                          ),
                          Expanded(
                            child: Container(
                              //margin: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 0),
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "${orderList[index]['name']}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: orderList[index]
                                                          ['status'] ==
                                                      'pending payment'
                                                  ? Colors.grey
                                                  : Colors.blue,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(5)),
                                          child: Text(
                                              "${orderList[index]['status']}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 11))),
                                    ],
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.only(right: 0, top: 10),
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Price - ${orderList[index]['price']}",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                      )),
                                  // Container(
                                  //     padding:
                                  //         EdgeInsets.only(right: 0, top: 10),
                                  //     margin: EdgeInsets.only(left: 15),
                                  //     child: Row(
                                  //       children: <Widget>[
                                  //         Text(
                                  //           "${orderList[index]['size']}",
                                  //           maxLines: 1,
                                  //           overflow: TextOverflow.ellipsis,
                                  //           style: TextStyle(
                                  //               color: Colors.grey
                                  //                   .withOpacity(0.7),
                                  //               fontSize: 12),
                                  //         ),
                                  //         Text(
                                  //           " | ",
                                  //           style: TextStyle(
                                  //               color: Colors.blue,
                                  //               fontSize: 12),
                                  //         ),
                                  //         Text(
                                  //           "${orderList[index]['camera']}",
                                  //           maxLines: 1,
                                  //           overflow: TextOverflow.ellipsis,
                                  //           style: TextStyle(
                                  //               color: Colors.grey
                                  //                   .withOpacity(0.7),
                                  //               fontSize: 12),
                                  //         ),
                                  //         Text(
                                  //           " | ",
                                  //           style: TextStyle(
                                  //               color: Colors.blue,
                                  //               fontSize: 12),
                                  //         ),
                                  //         Text(
                                  //           "${orderList[index]['ram']}",
                                  //           maxLines: 1,
                                  //           overflow: TextOverflow.ellipsis,
                                  //           style: TextStyle(
                                  //               color: Colors.grey
                                  //                   .withOpacity(0.7),
                                  //               fontSize: 12),
                                  //         ),
                                  //         Center(
                                  //           child: Text(
                                  //             " | ",
                                  //             style: TextStyle(
                                  //                 color: Colors.blue,
                                  //                 fontSize: 12),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           child: Text(
                                  //             "${orderList[index]['battery']}",
                                  //             maxLines: 1,
                                  //             overflow: TextOverflow.ellipsis,
                                  //             style: TextStyle(
                                  //                 color: Colors.grey
                                  //                     .withOpacity(0.7),
                                  //                 fontSize: 12),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     )),
                                  // Container(
                                  //     margin: EdgeInsets.only(top: 5, left: 8),
                                  //     child: Container(
                                  //         margin: EdgeInsets.only(left: 5),
                                  //         child: Container(
                                  //           margin: EdgeInsets.only(
                                  //               top: 5, left: 0),
                                  //           child: Container(
                                  //               margin:
                                  //                   EdgeInsets.only(left: 0),
                                  //               child: RatingBar(
                                  //                 initialRating: orderList[index]
                                  //                     ['rating'],
                                  //                 minRating: 1,
                                  //                 direction: Axis.horizontal,
                                  //                 allowHalfRating: true,
                                  //                 ignoreGestures: true,
                                  //                 itemCount: 5,
                                  //                 itemSize: 18,
                                  //                 itemPadding:
                                  //                     EdgeInsets.symmetric(
                                  //                         horizontal: 0.1),
                                  //                 itemBuilder: (context, _) =>
                                  //                     Icon(
                                  //                   Icons.star,
                                  //                   color: Colors.amber,
                                  //                   size: 15,
                                  //                 ),
                                  //                 onRatingUpdate: (rating) {
                                  //                   print(rating);
                                  //                 },
                                  //               )),
                                  //         ))
                                         // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })))));
  }
}
