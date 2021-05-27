import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_project/cart_purchase.dart';
import 'package:second_project/purchagepage.dart';
import 'package:second_project/seconddetaispage.dart';
import 'package:second_project/secondwatchdetailspage.dart';
import 'package:second_project/watchdetailscart.dart';
import 'package:second_project/wristwatch.dart';
import 'package:share/share.dart';
import 'package:flutter/rendering.dart';
import 'cart.dart';
import 'main.dart';

class WristwatchdetailsPage extends StatefulWidget {
  final wristwatchDetails;
  final watchList;
  WristwatchdetailsPage(this.wristwatchDetails, this.watchList);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Slider(value: null, onChanged: null),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  _WristwatchdetailsPageState createState() => _WristwatchdetailsPageState();
}

class _WristwatchdetailsPageState extends State<WristwatchdetailsPage> {
  List sliderPic = [];
  List sliderList = [
    {"id": "1", "picture": "assets/fastrack.jpg"},
    {"id": "1", "picture": "assets/fasttrack2.jpg"},
    {"id": "2", "picture": "assets/naviforce.jpg"},
    {"id": "2", "picture": "assets/naviforce2.jpg"},
    {"id": "3", "picture": "assets/rolex.jpg"},
    {"id": "3", "picture": "assets/rolex2.jpg"},
  ];
  @override
  initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < sliderList.length; i++) {
        if (widget.wristwatchDetails["id"].toString() == sliderList[i]["id"]) {
          sliderPic.add(sliderList[i]["picture"]);
        }
      }
    });
    print("sliderPic");
    print(sliderPic);
  }

  int pageIndex = 0;
  bool isFav = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          title: Text(
            "Details",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
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
                          padding: EdgeInsets.only(top: 10, bottom: 10),
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
                                    top: 10, bottom: 10, right: 20, left: 20),
                                child: Text(
                                  "${widget.wristwatchDetails['price']}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              userCartList.add({
                                'id': favLastId++,
                                'pic': widget.wristwatchDetails["pic"],
                                'name': widget.wristwatchDetails["name"],
                                'price': widget.wristwatchDetails["price"],
                                'size': widget.wristwatchDetails["size"],
                                'camera': widget.wristwatchDetails["camera"],
                                'ram': widget.wristwatchDetails["ram"],
                                'battery': widget.wristwatchDetails["battery"],
                                'rating': widget.wristwatchDetails["rating"],
                                'status': widget.wristwatchDetails["status"],
                                'count': widget.wristwatchDetails["count"],
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cartpage()));
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 15, left: 15),
                            child: Text(
                              "Add To Cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
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
                              userFavouriteList.add({
                                'id': favLastId++,
                                'pic': widget.wristwatchDetails["pic"],
                                'name': widget.wristwatchDetails["name"],
                                'price': widget.wristwatchDetails["price"],
                                'rating': widget.wristwatchDetails["rating"],
                                'status': widget.wristwatchDetails["status"],
                              });
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
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 30, right: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Model:${widget.wristwatchDetails['name']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Case thickness:${widget.wristwatchDetails['case_thickness']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Water resistant depth:${widget.wristwatchDetails['water_resistant_depth']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Class type:${widget.wristwatchDetails['class_type']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Band width:${widget.wristwatchDetails['band_width']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Status:${widget.wristwatchDetails['status']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Condition:${widget.wristwatchDetails['condition']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 0, bottom: 8),
                          child: Text(
                            "Posted:${widget.wristwatchDetails['posted']}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Share.share("Share text");
                },
                child: Container(
                  margin: EdgeInsets.only(left: 120, right: 120),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 20, bottom: 20, right: 10)),
                      Container(
                        child: Icon(
                          Icons.share,
                          size: 15,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          "Share",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      )
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
                  child: Column(children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 50)),
                          Container(
                            padding: EdgeInsets.only(right: 100),
                            child: Text(
                              "Related Products",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "${widget.watchList.length - 1} Products",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 20, bottom: 10, right: 10),
                        child: Row(
                          children:
                              List.generate(widget.watchList.length, (index) {
                            return widget.wristwatchDetails['name'] ==
                                    widget.watchList[index]["name"]
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WristwatchdetailsPage(
                                                      widget.watchList[index],
                                                      widget.watchList)));
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 180,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.black, width: 0.2)),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 5),
                                            child: Image.asset(
                                              "${widget.watchList[index]['pic']}",
                                              height: 120,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              "${widget.watchList[index]['name']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              "${widget.watchList[index]['price']}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),
                      ),
                    )
                  ]))
            ])),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 53,
            color: Colors.blue,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Watchdetailscart(widget.wristwatchDetails)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                            style: TextStyle(color: Colors.blue, fontSize: 12),
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
              )
            ])));
  }
}
