import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart_purchase.dart';
import 'package:second_project/cartdetails.dart';
import 'package:second_project/contact.dart';
import 'package:second_project/detailsPage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/order.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/purchagepage.dart';
import 'package:second_project/terms.dart';
import 'package:second_project/voucherpage.dart';
import 'package:http/http.dart' as http;
import 'favouritepage.dart';
import 'mainpage.dart';

class Cartpage extends StatefulWidget {
  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  var cartDetails;
  int index = 0, dataCount = 0;
  double total = 0.0, tt = 0.0;

  @override
  void initState() {
    super.initState();
    //fetchCart();
  }

  Future fetchCart() async {
    final response =
        await http.get(ipAddress4);
        print("response");
        print(response.body);
    cartDetails = json.decode(response.body);
    print(cartDetails);
    setState(() {
      for (int i = 0; i < cartDetails.length; i++) {
        int count = int.parse("${cartDetails[i]["count"]}");
        double price = double.parse(cartDetails[i]["price"]);
        userCartList.add({
          'id': cartDetails[i]["id"],
          'pic': cartDetails[i]["pic"],
          'name': cartDetails[i]["name"],
          'price': cartDetails[i]["price"],
          'status': cartDetails[i]["status"],
          'count': count,
        });
        dataCount += count;
        tt += price;
        total += (tt * dataCount);
      }

      cartLastID = userCartList.length == 0
          ? 0
          : Cartdetails(userCartList.length - 1, ["id"]);
    });

    print(dataCount);
    print(total);
    print(tt);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.grey[700], fontSize: 16,fontWeight: FontWeight.w300,),
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
                                        color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w300,),
                                  ),
                            ),
                                Container(
                                  child: Text(
                                    "Nooraiya khan",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black,fontWeight: FontWeight.w300,),
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
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mainpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
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
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartpage()));
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
                                    Icons.shopping_cart,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cart",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300,),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300,),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orderpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                      color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300,),
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
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
                                      color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300,),
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
                                        color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "2",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300,),
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
     
                  SizedBox(
                    height: 15,
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
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
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
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
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
                                          color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w300,),
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
                                                  fontSize: 15,fontWeight: FontWeight.w300,),
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
                                                  fontSize: 15,fontWeight: FontWeight.w300,),
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
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300,),
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
          child: userCartList.length == 0
              ? Center(
                  child: Text("No items available",style: TextStyle(fontWeight: FontWeight.w300,),),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      child: Column(
                    children: List.generate(userCartList.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey[700].withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "${userCartList[index]['pic']}",
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
                                              "${userCartList[index]['name']}",
                                              
                                              maxLines: 2,
                                              
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: userCartList[index]
                                                            ['status'] ==
                                                        'Used'
                                                    ? Colors.grey[700]
                                                    : Colors.blue,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(5)),
                                            child: Text(
                                                "${userCartList[index]['status']}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w300,))
                                          )  ],
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 10),
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Price - ${userCartList[index]['price']}",
                                          style: TextStyle(
                                              color: Colors.grey[700], fontSize: 12,fontWeight: FontWeight.w300,),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 5, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      userCartList[index]
                                                          ['count']++;
                                                    });
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 18,
                                                        color: Colors.blue,
                                                      ),
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 18,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[700]
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "${userCartList[index]['count']}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.grey[700]
                                                            .withOpacity(0.9),fontWeight: FontWeight.w300,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (userCartList[index]
                                                              ['count'] <=
                                                          0) {
                                                        userCartList[index]
                                                            ['count'] = 0;
                                                      } else {
                                                        userCartList[index]
                                                            ['count']--;
                                                      }
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 18,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                userCartList.removeAt(index);
                                              });
                                            },
                                            child: Container(
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.blue,
                                                size: 25,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
                )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 53,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w300,),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPurchagepage(userCartList)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Purchase",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.blue, fontSize: 12,fontWeight: FontWeight.w300,),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
