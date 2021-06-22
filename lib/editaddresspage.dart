import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/main.dart';
import 'package:second_project/profile.dart';

class Editaddresspage extends StatefulWidget {
  @override
  _EditaddresspageState createState() => _EditaddresspageState();
}

class _EditaddresspageState extends State<Editaddresspage> {
  bool isTitleBlank = false;
  bool isHouseBlank = false;
  bool isStreetBlank = false;
  bool isAreaBlank = false;
  bool isBlockBlank = false;
  bool isFloorBlank = false;
  bool isAreaInvalid = false;
  bool isOther = false;
  var child;
  TextEditingController titleController = new TextEditingController();
  TextEditingController houseController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();
  TextEditingController areaController = new TextEditingController();
  TextEditingController blockController = new TextEditingController();
  TextEditingController floorController = new TextEditingController();

  @override
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
          // actions: [
          //   IconButton(
          //       icon: Icon(
          //         Icons.add_circle_outline,
          //         color: Colors.blue,
          //       ),
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Editaddresspage()));
          //       }),
          // ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    isOther
                                        ? Container(
                                            //height: 50,
                                            //width: 320,
                                            margin: EdgeInsets.only(top: 5),
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 0,
                                                bottom: 0),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                border: Border.all(width: 0.1),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: TextField(
                                              controller: titleController,
                                              decoration: InputDecoration(
                                                  hintText: "Type title",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 15,
                                                     fontWeight: FontWeight.w300
                                                  ),
                                                  labelText: "Enter title",
                                                  labelStyle: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w300
                                                  ),
                                                  border: InputBorder.none),
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isTitleBlank
                                        ? Container(
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
                                                  "Title is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,fontWeight: FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    Container(
                                      //height: 50,
                                      //width: 320,
                                      margin: EdgeInsets.only(top: 5),
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 0,
                                          bottom: 0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border: Border.all(width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextField(
                                        controller: houseController,
                                        decoration: InputDecoration(
                                            hintText: "Type house plot nmuber",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300
                                            ),
                                            labelText:
                                                "Enter house/plot number(optional)",
                                            labelStyle: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w300
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    isHouseBlank
                                        ? Container(
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
                                                  "House is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight: FontWeight.w300
                                                      ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: streetController,
                                          decoration: InputDecoration(
                                              hintText: "Type street/road",
                                              hintStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15,
                                              ),
                                              labelText: "Enter street/road",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w300
                                              ),
                                              border: InputBorder.none),
                                        )),
                                        SizedBox(height: 10,),
                                    isStreetBlank
                                        ? Container(
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
                                                  "Street is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
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
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: areaController,
                                          decoration: InputDecoration(
                                              hintText: "Type area",
                                              hintStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300
                                              ),
                                              labelText:
                                                  "Enter area(ex:Taltola)",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w300
                                              ),
                                              border: InputBorder.none),
                                        )),
                                        SizedBox(height: 10,),
                                    isAreaBlank
                                        ? Container(
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
                                                  "Area is empty",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: blockController,
                                          decoration: InputDecoration(
                                              hintText: "Type block/sector",
                                              hintStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15,
                                              ),
                                              labelText:
                                                  "Enter block/sector(optional)",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w300
                                              ),
                                              border: InputBorder.none),
                                        )),
                                        SizedBox(height: 10,),
                                    isBlockBlank
                                        ? Container(
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
                                                  "Block is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,fontWeight: FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      padding:
                                          EdgeInsets.only(left: 10, right: 0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border: Border.all(width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextField(
                                        controller: floorController,
                                        decoration: InputDecoration(
                                          hintText: "Type floor/flat",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700], fontSize: 15,fontWeight: FontWeight.w300),
                                          labelText:
                                              "Enter floor/flat(optional)",
                                          labelStyle: TextStyle(
                                            color: Colors.blue,fontWeight: FontWeight.w300
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:10,),
                                    isFloorBlank
                                        ? Container(
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
                                                  "Floor is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent,fontWeight: FontWeight.w300),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (streetController.text == "") {
                                            isHouseBlank = false;
                                            isStreetBlank = true;
                                            isAreaBlank = false;
                                            isBlockBlank = false;
                                            isFloorBlank = false;
                                          } else if (areaController.text ==
                                              "") {
                                            isHouseBlank = false;
                                            isStreetBlank = false;
                                            isAreaBlank = true;
                                            isBlockBlank = false;
                                            isFloorBlank = false;
                                          } else if (floorController.text ==
                                              "") {
                                            isHouseBlank = false;
                                            isStreetBlank = false;
                                            isAreaBlank = false;
                                            isBlockBlank = false;
                                            isFloorBlank = true;
                                          } else {
                                            setState(() {
                                              userAddressList.add({
                                                'id': lastId++,
                                                'house': houseController.text,
                                                'street': streetController.text,
                                                'area': areaController.text,
                                                'block': blockController.text,
                                                'floor': floorController.text,
                                              });
                                            });
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.arrow_right,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])
                  ]),
            )));
  }
}
