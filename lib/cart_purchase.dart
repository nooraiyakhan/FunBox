import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/order.dart';
import 'package:second_project/detailsPage.dart';

import 'package:second_project/mainpage.dart';
import 'package:second_project/orderdetails.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPurchagepage extends StatefulWidget {
  final mobileDetails;
  CartPurchagepage(this.mobileDetails);
  @override
  _CartPurchagepageState createState() => _CartPurchagepageState();
}

class _CartPurchagepageState extends State<CartPurchagepage> {
  TextEditingController voucherController = new TextEditingController();
  TextEditingController textfieldController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  double totalAmt = 0.00;
  int index = 0, dataCount = 0;
  double total = 0.0, tt = 0.0;
  bool isMark = false;
  bool isTextfieldBlank = false;
  bool isAddresseditBlank = false;
  bool isNumbereditBlank = false;
  var child;
  var orderDetails, itemList = [], userOrderList = [];
  DateTime _dateTime;
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrder();
  }

  fetchOrder() async {
    final response =
        await http.get('http://192.168.0.101/Funbox/orderdetails.php');

    setState(() {
      orderDetails = json.decode(response.body);
    });

    print(orderDetails);

    for (int i = 0; i < orderDetails.length; i++) {
      int count = 1;
      String pp = orderDetails[i]["price"]
          .toString()
          .replaceAll(",", "")
          .replaceAll("/", "")
          .replaceAll("-", "");
      double price = double.parse(pp);
      double rat = double.parse(orderDetails[i]["rating"]);
      itemList.add(
        {
          'id': orderDetails[i]["id"],
          'pic': orderDetails[i]["pic"],
          'name': orderDetails[i]["name"],
          'price': pp,
          'rating': rat,
          'status': orderDetails[i]["status"],
        },
      );
      dataCount += count;
      tt += price;
      total += (tt * dataCount);
    }

    print(itemList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          title: Text(
            "Checkout",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(

              // Container(
              child: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Shopping Details",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Total Product",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                          child: Text("1",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Total Price",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(),
                          Container(
                            child: Text(
                              "$total",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Coupon Discount",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            child: Text(
                              "-",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ),
                          Container(
                            child: Text(
                              voucherController.text == "" ? "0.0/-" : "50.0/-",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Shipping Cost",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            child: Text(
                              "100.0/-",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Total Payable",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            child: Text(
                              "$totalAmt/-",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    // margin: EdgeInsets.only(right: 70),
                    padding: EdgeInsets.only(bottom: 0, top: 0, left: 5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      children: [
                        Container(
                          child: Flexible(
                            child: TextField(
                              controller: voucherController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type voucher number.."),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (voucherController.text != "") {
                                totalAmt -= 50.0;
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 15, top: 16, bottom: 16, left: 15),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Apply",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Deliver To ",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "John Smith",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 17,
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  address,
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addresspage()));
                          },
                          child: Container(
                            child: Text(
                              "Choose",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Delivery Date",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.grey,
                        size: 17,
                      )),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   width: 155,
                          // ),
                          Container(
                            child: Text(
                              _dateTime == null
                                  ? 'Choose delivery date'
                                  : _dateTime.toString(),
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.start,

                              // "Choose",
                              // style: TextStyle(
                              //     color: Colors.blue, fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            width: 34,
                          ),
                          RaisedButton(
                              child: Text(
                                "Choose",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: _dateTime == null
                                            ? DateTime.now()
                                            : _dateTime,
                                        firstDate: DateTime(2021),
                                        lastDate: DateTime(2040))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });
                              })
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Payment Details",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Cash on delivery",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 17,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: Row(
                        children: [
                          Container(
                              // padding: EdgeInsetsDirectional.only(end: 165),
                              child: Text(
                            "New York,USA",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          )),
                          SizedBox(
                            width: 165,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMark = true;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: !isMark ? Colors.grey : Colors.blue,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Crd Payment",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Icon(
                        Icons.payment,
                        color: Colors.grey,
                        size: 17,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: Row(
                        children: [
                          Container(
                              // padding: EdgeInsetsDirectional.only(end: 165),
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text(
                                "1283 6748 9374 6528",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMark = false;
                              });
                            },
                            child: Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: isMark ? Colors.grey : Colors.blue,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          )
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                            title: Text(
                              "To confirm your order you have to pay 25% (500/-) through bikash (01XXXXXXXXX)",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onPressed: () {
                                  print("OK");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Orderpage()));
                                },
                              )
                            ],
                          ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Submit Order",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  padding: EdgeInsets.only(
                      left: 120, right: 120, top: 10, bottom: 10),
                ))
          ])),
        )));
  }
}
