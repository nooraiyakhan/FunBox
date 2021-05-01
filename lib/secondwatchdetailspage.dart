import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_project/wristwatchdetails.dart';
import 'package:share/share.dart';
class SecondwatchdetailsPage extends StatefulWidget {
final wristwatchDetails;
  SecondwatchdetailsPage(this.wristwatchDetails);
  Widget build(BuildContext context){
    return MaterialApp(
      home: Slider(value: null, onChanged: null),
      debugShowCheckedModeBanner: false,
    );
  }
  @override
  _SecondwatchdetailsPageState createState() => _SecondwatchdetailsPageState();
}

class _SecondwatchdetailsPageState extends State<SecondwatchdetailsPage> {
    List sliderPic = [
    "assets/naviforce.jpg", 
    "assets/fastrack.jpg",
    "assets/naviforce.jpg"
  ];
  int pageIndex = 0;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          "Details",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        //  content: Image.asset("assets/passreset.jpg"),
                        title: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    // padding: EdgeInsets.only(left: 100),
                                    child: Icon(
                                      Icons.close_sharp,
                                      color: Colors.transparent,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.grey[700],
                                      size: 30,
                                    ),
                                  ),
                               //   SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Flexible(
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        // padding: EdgeInsets.only(left: 100),
                                        child: Icon(
                                          Icons.close_sharp,
                                          color: Colors.grey[700],
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                "John Smith",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Icon(
                                      Icons.phone,
                                      size: 15,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "01XXXXXXXXX",
                                      style: TextStyle(
                                       
                                          color: Colors.grey[700],
                                          //fontWeight: FontWeight.w900,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 70, right: 70),
                                // padding: EdgeInsets.only(left: 20,right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 0, bottom: 0),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        "Call",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
       body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Stack(
              children: [
                CarouselSlider(
                  items: sliderPic.map((i) {
                    return new Builder(builder: (BuildContext context) {
                      return new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: new EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: new BoxDecoration(color: Colors.white),
                        child: new GestureDetector(
                          child: Image.asset(
                            i,
                          ),
                          onTap: () {
                            //Navigator.push(context,MaterialPageRoute(builder: (context)=>Show (url:i)));
                          },
                        ),
                      );
                    });
                  }).toList(),

                    height: 250.0,
                  autoPlay: true,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                ),
                  Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey),
                          margin: EdgeInsets.only(right: 30),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${pageIndex + 1}/${sliderPic.length}",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CarouselIndicator(
              count: sliderPic.length,
              index: pageIndex,
              color: Colors.grey,
              activeColor: Colors.blue,
              height: 7,
              width: 7,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  // margin: EdgeInsets.only(right: 210),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20),
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 17,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(
                                "10,00000...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isFav) {
                              isFav = false;
                            } else {
                              isFav = true;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.favorite,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: 140, left: 0, top: 10, bottom: 8),
                      child: Text(
                        "Product Information",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            right: 215, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Type : New",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            right: 182, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Category : Watch",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            right: 110, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Product Condition : Very Good",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            right: 164, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Posted : 2 Days Ago",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: 222, left: 0, top: 10, bottom: 8),
                      child: Text(
                        "General",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            right: 182, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Brand : Naviforce",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            right: 127, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Brand Material Type : Metal",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            right: 133, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Watch Movement : Quartz",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                        Container(
                        padding: EdgeInsets.only(
                            right: 173, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Dial Colour : Black",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                        Container(
                        padding: EdgeInsets.only(
                            right: 165, left: 0, top: 0, bottom: 8),
                        child: Text(
                          "Band Colour : Black",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                  ],
                ),
              ),
            ),
           
           
            ])));}
  
     
        
         
   

      
   
  }

      
  

