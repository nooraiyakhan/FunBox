import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:second_project/main.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/purchagepage.dart';
import 'package:second_project/terms.dart';
import 'package:second_project/voucherpage.dart';
import 'package:http/http.dart' as http;
import 'addresspage.dart';
import 'cart.dart';
import 'loginpage.dart';
import 'mainpage.dart';
import 'order.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  var favouriteDetails = [];
 @override
  void initState() {
    super.initState();
    //fetchFavourite();
  }
fetchFavourite() async {
    final response =
        await http.get(ipAddress5);
    setState(() {
      favouriteDetails = json.decode(response.body);
      for (int i = 0; i < favouriteDetails.length; i++) {
        double rat = double.parse(favouriteDetails[i]["rating"]);
        userFavouriteList.add({
          'id': favouriteDetails[i]["id"],
          'pic': favouriteDetails[i]["pic"],
          'name': favouriteDetails[i]["name"],
          'price': favouriteDetails[i]["price"],
         
          'rating': rat,
          'status': favouriteDetails[i]["status"],
        });
      }

      favLastId = userFavouriteList.length == 0
          ? 0
          : favouriteDetails[userFavouriteList.length - 1]["id"];
    });
    print(favouriteDetails);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "Favourite",
          style: TextStyle(color: Colors.grey, fontSize: 17),
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
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Nooraiya khan",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
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
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
                                        color: Colors.grey, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
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
                                      color: Colors.grey, fontSize: 14),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.blue),
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
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
                                      color: Colors.grey, fontSize: 14),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.blue),
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
                        padding: EdgeInsets.all(15),
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Favourite",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "2",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14),
                            )
                          ],
                        )),
                  ),
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
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
                                  TextStyle(color: Colors.grey, fontSize: 14),
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
          child: userFavouriteList.length == 0
              ? Center(child: Text("No items available!"))
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      child: Column(
                    children: List.generate(userFavouriteList.length, (index) {
                      return Container(
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
                              "${userFavouriteList[index]['pic']}",
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
                                              "${userFavouriteList[index]['name']}",
                                              maxLines: 2,
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
                                                color: userFavouriteList[index]
                                                            ['status'] ==
                                                        'Used'
                                                    ? Colors.grey
                                                    : Colors.blue,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(5)),
                                            child: Text(
                                                "${userFavouriteList[index]['status']}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)))
                                      ],
                                    ),
                                    Container(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 10),
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "Price - ${userFavouriteList[index]['price']}/-",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        )),
                                    Container(
                                        padding:
                                            EdgeInsets.only(right: 0, top: 10),
                                        margin: EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: <Widget>[
                                          
                                          ],
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 5, left: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: RatingBar(
                                                initialRating:
                                                    userFavouriteList[index]
                                                        ['rating'],
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                ignoreGestures: true,
                                                itemCount: 5,
                                                itemSize: 18,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.1),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              )),
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    userFavouriteList.removeAt(index);
                                                  });
                                                },
                                                child: Container(
                                                  child: Icon(Icons.delete,color: Colors.blue,size: 25,),
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
    );
  }
}
