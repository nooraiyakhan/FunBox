import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/editpassword.dart';
import 'package:second_project/emailpage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/sendver.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  bool isNameBlank = false;
  bool isMobileNumberBlank = false;
  bool isPhoneInvalid = false;
  bool isEmailBlank = false;
  bool isPasswordBlank = false;
  bool isConfirmPasswordBlank = false;
  bool isDeliveryAddressBlank = false;
  bool isNidNumberBlank = false;
  String confirmOkMsg = "Confirm password field is empty!",
      emailOkMsg = "Email field is empty!";
  var child;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController mobilenumbercontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confirmpasswordcontroller = new TextEditingController();
  TextEditingController deliveryaddresscontroller = new TextEditingController();
  TextEditingController nidnumbercontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 0, top: 20, bottom: 0),
                        child: Text(
                          "Register Yourself!",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Please enter your credential to sign up ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w300),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Column(
                        children: <Widget>[
                          Container(
                            // height: 100,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: namecontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Name...",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        labelText: "Enter Your Name.",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isNameBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Your name field is empty!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: mobilenumbercontroller,
                                    onChanged: (value) {
                                      setState(() {
                                        phone = value;
                                        if (phone.length > 11) {
                                          phone = "";
                                          mobilenumbercontroller.text = phone;
                                        }
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Phone Number...",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        labelText: "Enter Your Phone Number.",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isMobileNumberBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Number field is empty!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                isPhoneInvalid
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Invalid number.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${phone.length}/11",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your E-mail...",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        labelText: "Enter Your Email. ",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isEmailBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              emailOkMsg,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: passwordcontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Password...",
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                            fontSize: 15),
                                        labelText: "Enter Your Password.",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isPasswordBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Password field is empty!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: confirmpasswordcontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your Password...",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        labelText: "Confirm Password.",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isConfirmPasswordBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              confirmOkMsg,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey[100]),
                                  child: TextField(
                                    controller: nidnumbercontroller,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type Your NID Number...",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                        labelText: "Enter NID Number",
                                        labelStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w300)),
                                  ),
                                ),
                                isNidNumberBlank
                                    ? Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.redAccent,
                                              size: 17,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "NID number field is empty!",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (namecontroller.text == "") {
                                  isNameBlank = true;
                                  isMobileNumberBlank = false;
                                  isPhoneInvalid = false;
                                  isEmailBlank = false;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = false;
                                } else if (mobilenumbercontroller.text == "") {
                                  isPhoneInvalid = true;
                                  isNameBlank = false;
                                  isMobileNumberBlank = true;
                                  isEmailBlank = false;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = false;
                                } else if (emailcontroller.text == "") {
                                  isNameBlank = false;
                                  isPhoneInvalid = false;
                                  isMobileNumberBlank = false;
                                  isEmailBlank = true;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = false;
                                } else if (!emailcontroller.text
                                        .contains("@") ||
                                    !emailcontroller.text.contains(".")) {
                                  isNameBlank = false;
                                  isMobileNumberBlank = false;
                                  isPhoneInvalid = false;
                                  isEmailBlank = true;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = false;
                                  emailOkMsg = "Email is invalid!";
                                } else if (passwordcontroller.text == "") {
                                  isNameBlank = false;
                                  isMobileNumberBlank = false;
                                  isPhoneInvalid = false;
                                  isEmailBlank = false;
                                  isPasswordBlank = true;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = false;
                                } else if (confirmpasswordcontroller.text ==
                                    "") {
                                  isNameBlank = false;
                                  isMobileNumberBlank = false;
                                  isPhoneInvalid = false;
                                  isEmailBlank = false;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = true;

                                  isNidNumberBlank = false;
                                } else if (confirmpasswordcontroller.text !=
                                    passwordcontroller.text) {
                                  isNameBlank = false;
                                  isMobileNumberBlank = false;
                                  isPhoneInvalid = false;
                                  isEmailBlank = false;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = true;

                                  isNidNumberBlank = false;
                                  confirmOkMsg = "Password not matched!";
                                } else if (nidnumbercontroller.text == "") {
                                  isNameBlank = false;
                                  isMobileNumberBlank = false;
                                  isEmailBlank = false;
                                  isPasswordBlank = false;
                                  isConfirmPasswordBlank = false;

                                  isNidNumberBlank = true;
                                } else {
                                  var payLoad = {
                                    "name": namecontroller.text,
                                    "phone": mobilenumbercontroller.text,
                                    "email": emailcontroller.text,
                                    "password": passwordcontroller.text,
                                    "nid": nidnumbercontroller.text
                                  };
                                  sendUserInfo(payLoad);
                                  userList.add(payLoad);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Sendverpage()));
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 20, left: 20, right: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]))));
  }

  Future sendUserInfo(payLoad) async {
    final response = await http.post(registerEndPoint, body: payLoad);

    print(response);

    int statusCode = response.statusCode;
    print(statusCode);
    String bodyResponse = response.body;
    print(bodyResponse);
  }
}
