import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:second_project/addresspage.dart';
import 'package:second_project/cart.dart';
import 'package:second_project/editprofile.dart';
import 'package:second_project/favouritepage.dart';
import 'package:second_project/homepage.dart';
import 'package:second_project/loginpage.dart';
import 'package:second_project/mainpage.dart';
import 'package:second_project/order.dart';
import 'package:second_project/terms.dart';
import 'package:second_project/voucherpage.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   var profileDetails;
  int index=0;
  void initState(){
    super.initState();
    // fetchProfile();
  }
  fetchProfile() async{
    final response=await http.get(ipAddress7);
    setState(() {
      profileDetails=json.decode(response.body);
    });
   
    for(int i=0;i<=profileDetails.length;i++){
      userProfileList.add(
        {
          // 'id': profileDetails[i]["id"],
        'name': profileDetails[i]["name"],
        'number': profileDetails[i]["number"],
        'email': profileDetails[i]["email"],
       
        }
      );
    }
     print("profileDetails");
    // lastId=profileDetails.length==0
    // ?0
    // :profileDetails[profileDetails.length-1]["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditprofilePage()));
                })
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
                                        TextStyle(color: Colors.grey, fontSize: 13),
                                        
                                  ),
                                ),
                             
                            ],
                          )),
                    ),
              
                  // SizedBox(
                  //   height: 30,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                       // margin: EdgeInsets.only(right: 15),
                        
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
                                  TextStyle(color: Colors.blue, fontSize: 13),
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
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13),
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
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 13),
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
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                 GestureDetector (
                   onTap: (){
                     Navigator.pop(context);
                     Navigator.push(context,
                     MaterialPageRoute(builder:(context)=>Voucherpage() )
                     );
                   },
                    child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: 
                        Row(
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
                                  style: TextStyle(color: Colors.grey, fontSize: 13),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text("4",style: TextStyle(color: Colors.blue),),
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
                                          color: Colors.grey, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14), )],)),   ),
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
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>Termspage())
                      
                      );
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
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        )),
                  ),
               SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){
                      
                     showDialog(context: context,
                     builder: (BuildContext context) => AlertDialog(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Container(
                          child: Text("Do you want to Log Out?",style: TextStyle(color: Colors.grey,fontSize: 15),),
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
                                  child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 15),),
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
                                child: Text("No",style: TextStyle(color: Colors.white,fontSize: 15),),
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
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
        ),
        body:
         SingleChildScrollView(
           physics: BouncingScrollPhysics(),
           child: Container(
              child: Column(
                children:List.generate(userProfileList.length, (index) {
                  return 
                  Column(
                   // crossAxisAlignment: CrossAxisAlignment.start, 
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(top: 20, left: 10, bottom: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/profile.jpg")),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 35),
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )),
                  Container(
                      child: Text(
                     "${userProfileList[index]['name']}",
                       style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),  )),    ], )] 
                        
                         ),
         //   Divider();
           
            Divider(),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                       "${userProfileList[index]['number']}",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    )
                  ],
                )
              ]),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                      "${userProfileList[index]['email']}",
                        style: TextStyle(color: Colors.grey, fontSize: 14), ), )],) ]), )]);
              

                })
                 
      
             ), )));
  }
}
