import 'package:flutter/material.dart';
import 'package:second_project/loginpage.dart';

class Sendverpage extends StatefulWidget {
  @override
  _SendverpageState createState() => _SendverpageState();
}

class _SendverpageState extends State<Sendverpage> {
  bool isSeen = false;
  bool isPassBlank = false;
  var child;
  TextEditingController passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/enter.jpg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        //padding: EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey[100],
                            border: Border.all(width: 0.1)),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: passController,
                                obscureText: isSeen == false ? true : false,

                                ///password visible (false) or password not visible (true)
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Verification Code",
                                  hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSeen == false) {
                                      isSeen = true;
                                    } else {
                                      isSeen = false;
                                    }
                                  });
                                },
                                child: Icon(
                                  isSeen == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 22,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      isPassBlank
                          ? Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Code Field Is Empty",style: TextStyle(fontWeight: FontWeight.w300),)
                                ],
                              ),
                            )
                          : Container(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (passController.text.isEmpty) {
                              isPassBlank = true;
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginpage()));
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 30, bottom: 20, left: 10, right: 10),
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
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16,fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            )));
  }
}
