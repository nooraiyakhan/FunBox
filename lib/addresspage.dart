import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/contact.dart';
import 'package:second_project/editaddresspage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/terms.dart';
import 'package:second_project/voucherpage.dart';
import 'package:http/http.dart' as http;
import 'favouritepage.dart';

class Addresspage extends StatefulWidget {
  @override
  _AddresspageState createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage> {
  var addressDetails;
  int index = 0;
  @override
  void initState() {
    super.initState();
    fetchAddress();
  }

  fetchAddress() async {
    final response = await http.get(ipAddress3);
    setState(() {
      addressDetails = json.decode(response.body);
      // final response=
      // await http.get('http://192.168.31.75/Funbox/addresslist.php');
      // setState(() {
      //   addressDetails= json.decode(response.body);
    });
    print("addressDetails");
    for (int i = 0; i < addressDetails.length; i++) {
      userAddressList.add({
        'id': addressDetails[i]["id"],
        'house': addressDetails[i]["house"],
        'street': addressDetails[i]["street"],
        'area': addressDetails[i]["area"],
        'block': addressDetails[i]["block"],
        'floor': addressDetails[i]["floor"],
      });
    }

    lastId = addressDetails.length == 0
        ? 0
        : addressDetails[addressDetails.length - 1]["id"];
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Text(
            "My Address",
            style: TextStyle(
                color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w300),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Editaddresspage()));
                }),
          ],
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
                        // color: Colors.blue,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                           padding: EdgeInsets.only(left: 15, right: 15),
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
                            style: TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
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
                                      builder: (context) => Orderpage()));
                            },
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.format_align_justify,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Orders",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
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
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Address",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300),
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
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Vouchers",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "4",
                                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),
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
                              size: 20,
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
                                          color: Colors.grey, fontSize: 15,fontWeight: FontWeight.w300),
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
                                                  fontSize: 15,fontWeight: FontWeight.w300),
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
                                                  fontSize: 15,fontWeight: FontWeight.w300),
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
          )),
        ),
        body: SafeArea(
            child: userAddressList.length == 0
                ? Center(child: Text("No address found",style: TextStyle(fontWeight: FontWeight.w300),))
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        child: Column(
                      children: List.generate(userAddressList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              address = userAddressList[index]['house'] +
                                  ", " +
                                  userAddressList[index]['street'] +
                                  ", " +
                                  userAddressList[index]['area'] +
                                  ", " +
                                  userAddressList[index]['block'] +
                                  ", " +
                                  userAddressList[index]['floor'];
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 5, left: 30, right: 10),
                              // height:200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                    "House/plot:${userAddressList[index]['house']}",
                                    maxLines: 4,
                                  style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w400),),
                                  ),
                                  Container(
                                    child: Text(
                                      "Street/road:${userAddressList[index]['street']}",
                                        maxLines: 4,
                                       style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w400),),
                                    
                                    ),
                                
                                  Container(
                                    child: Text(
                                      "Area:${userAddressList[index]['area']}",
                                      maxLines: 4,
                                      style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w400),),
                                    ),
                                 
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Block/sector:${userAddressList[index]['block']}",
                                          maxLines: 4,
                                          style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text(
                                      "Floor/flat:${userAddressList[index]['floor']}",
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  // ),
                                  Row(
                                  
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Editaddresspage()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Icon(
                                            Icons.edit,
                                            size: 25,
                                            color: Colors.blue,

                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            userAddressList.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                           margin: EdgeInsets.only(bottom: 20,right: 10),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.blue,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }),
                    )))));
  }
}
