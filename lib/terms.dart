import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/contact.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
import 'package:second_project/profile.dart';
import 'package:second_project/voucherpage.dart';

import 'favouritepage.dart';
class Termspage extends StatefulWidget {
  @override
  _TermspageState createState() => _TermspageState();
}

class _TermspageState extends State<Termspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "Terms and Conditions",
          style: TextStyle(
              color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ),
      body:Column(
        
     crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(padding: EdgeInsets.only(top: 20,left: 20)),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text("* 1 year official warranty.",style: TextStyle(fontWeight: FontWeight.w300,fontSize:14),),),
            SizedBox(height: 5,),
           Container(
             padding: EdgeInsets.only(left: 10),
             child: Text("* Used phone have 7 days warranty(without display and battery).",style: TextStyle(fontWeight: FontWeight.w300,fontSize:14),),),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("* You get 25% reduction if you return product.",style: TextStyle(fontWeight: FontWeight.w300,fontSize:14),)
            )],
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>Mainpage()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        //margin: EdgeInsets.only(right: 15),

                        child: Container(
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
                                    TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
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
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>Cartpage()));
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
                                        color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 14),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Orderpage()));
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
                                        color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 14),
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
                                  TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
                        // decoration:
                        //     BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                       padding: EdgeInsets.only(left: 15, right: 15),
                        child:
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            
                             Container(
                               child: Row(
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
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
                                  )
                                ],
                        ),
                             ),
                            
                                Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.blue
                                  , fontSize: 14),
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
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14), )],)),   ),
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
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>Termspage())
                      );
                    },
                    child: Container(
                      decoration: 
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                        padding: EdgeInsets.all( 15),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.security,
                              color: Colors.blue,
                              size: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Terms and Conditions",
                              style: TextStyle(color: Colors.blue, fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                          ],
                        )),
                  ),
                   SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
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
                  GestureDetector(
                    onTap: (){
                      
                     showDialog(context: context,
                     builder: (BuildContext context) => AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          child: Text("Do you want to Log Out?",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                        ),
                        SizedBox(height: 20,),
                        Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>Loginpage())
                                
                                );

                              },
                             
                                child: Container(
                                  padding: EdgeInsets.only(left: 18,right: 18,top: 6,bottom: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                                ),
                              ),
                           
                            SizedBox(width: 15,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 18,right: 18,top: 6,bottom: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,borderRadius: BorderRadius.circular(5)
                                ),
                                child: Text("No",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                            ),
                          ],
                        ),
                          )
                      ],)
                     ));
                    
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
                              style: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w300),
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
    );
  }
}