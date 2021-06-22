import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/editaddresspage.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
class Blankpage extends StatefulWidget {
  @override
  _BlankpageState createState() => _BlankpageState();
}

class _BlankpageState extends State<Blankpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text("My Address",
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
          fontWeight:FontWeight.w300
        ),
        
        
        ),
        actions: [
          IconButton(icon: 
          Icon(Icons.add_circle_outline,color: Colors.blue,)
          
          , onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Editaddresspage())
            );
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
                                        color: Colors.grey, fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        ),
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
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mainpage()));
                    },
              
                     
                      child: Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(left: 15),
                          color: Colors.blue,
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
                                        TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                                        
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
                        decoration: BoxDecoration(
                            color: Colors.blue),
                            //borderRadius: BorderRadius.only(
                               // topRight: Radius.circular(25),
                               // bottomRight: Radius.circular(25))),
                        //padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 16,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300,),
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
                                        color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300,),
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
                                        color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13,fontWeight: FontWeight.w300,),
                          )
                        ],
                      )),
                  
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Addresspage())
                      );
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
                              style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
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
                            style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
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
                            style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )),
        ),
      
    );
  }
}