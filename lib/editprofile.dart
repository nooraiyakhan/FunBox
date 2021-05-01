import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:second_project/editpassword.dart';
import 'package:second_project/main.dart';
import 'package:second_project/profile.dart';

class EditprofilePage extends StatefulWidget {
  @override
  _EditprofilePageState createState() => _EditprofilePageState();
}

class _EditprofilePageState extends State<EditprofilePage> {
    bool isNameBlank=false;
  bool isPhoneBlank=false;
  bool isPhoneInvalid=false;
  bool isEmailBlank=false;
  bool isEmailInvalid=false;
  String phone="0";
  var child;
 
 

   TextEditingController nameController = new TextEditingController();
   TextEditingController phoneController=new TextEditingController();
    TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditpasswordPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.enhanced_encryption,
                        color: Colors.blue,
                      ),
                    ))
              ],
            )
          ],
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
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 0,
                            bottom: 10,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/profile.jpg",
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 40,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.photo,
                                          color: Colors.black45,
                                          size: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "Select photo",
                                          style:
                                              TextStyle(color: Colors.black45),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  //height: 50,
                                  //width: 320,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 0, bottom: 0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: TextField(
                                    keyboardType:TextInputType.text,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        hintText: "Example name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        labelText: "Enter name",
                                        labelStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        border: InputBorder.none),
                                  )),
                                  SizedBox(height: 10,),
                                  isNameBlank
                                  ?Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline,
                                      color: Colors.redAccent,
                                      size: 17,
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Name field is blank",
                                        style: TextStyle(color: Colors.redAccent),
                                      )
                                    ],
                                  )
                                  :Container(),
                             
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  //height: 50,
                                  //width: 320,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 0, bottom: 0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: TextField(
                                    controller: phoneController,
                                    onChanged: (value){
                                      setState(() {
                                        phone=value;
                                        if(phone.length>11){
                                          phone="";
                                          phoneController.text=phone;
                                          
                                        }
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "01XXXXXXXXX",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        labelText: "Enter contact number",
                                        labelStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        border: InputBorder.none),
                                  )),
                                  SizedBox(height: 10,),
                                  isPhoneBlank
                                  ?Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                                      Text("Phone number field is blank",style: TextStyle(color: Colors.redAccent),)
                                    ],
                                  )
                                  :Container(),
                                  Container(
                                    margin: EdgeInsets.only(right: 20,top: 5),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "${phone.length}/11",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                   SizedBox(height: 10,),
                                  isPhoneInvalid
                                  ?Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                                      Text("Phone number is invalid",style: TextStyle(color: Colors.redAccent),),
                                    ],
                                  ):Container(),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  //height: 50,
                                  //width: 320,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 0, bottom: 0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(width: 0.1),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      
                                        hintText: "example@demo.com",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        labelText: "Enter email",
                                        labelStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        border: InputBorder.none),
                                  )),
                                   SizedBox(height: 10,),
                                  isNameBlank
                                  ?Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Container(
                                       child: Icon(Icons.error_outline,size: 17,color: Colors.redAccent,),
                                       
                                     ),
                                     Container(
                                       child: Text("Email field is blank",style: TextStyle(color: Colors.redAccent),),
                                     )
                                   ],
                                  )
                                  :Container(),
                                   SizedBox(height: 10,),
                                   isEmailInvalid
                                   ?Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         child: Icon(Icons.error_outline,color: Colors.red,size: 17,),
                                       ),
                                       Container(
                                         child:Text("Email is invalid",style: TextStyle(color: Colors.redAccent),),
                                       )
                                     ],
                                   ):Container(),
                                
                           
                                 GestureDetector(
                               onTap: (){
                                setState(() {
                                      if(nameController.text==""){
                                     isNameBlank=true;
                                     isPhoneBlank=false;
                                     isPhoneInvalid=false;
                                     isEmailBlank=false;
                                     isEmailInvalid=false;
                                    
                                   }else if(phoneController.text==""){
                                        isNameBlank=false;
                                     isPhoneBlank=true;
                                     isPhoneInvalid=false;
                                     isEmailBlank=false;
                                     isEmailInvalid=false;
                                    
                                   } else if(phone.length < 11){
                                       isNameBlank=false;
                                     isPhoneBlank=false;
                                     isPhoneInvalid=true;
                                     isEmailBlank=false;
                                     isEmailInvalid=false;
                                    
                                   }
                                   else if(emailController.text==""){
                                       isNameBlank=false;
                                     isPhoneBlank=false;
                                     isPhoneInvalid=false;
                                     isEmailBlank=true;
                                     isEmailInvalid=false;
                                    
                                   }
                                   else if(emailController.text==""){
                                       isNameBlank=false;
                                     isPhoneBlank=false;
                                     isPhoneInvalid=false;
                                     isEmailBlank=false;
                                     isEmailInvalid=true;
                                    
                                   } else {
                                            setState(() {
                                              userProfileList.add({
                                                'id': lastId++,
                                                'name': nameController.text,
                                                'number': phoneController.text,
                                                'email': emailController.text,
                                                
                                              });
                                            });
                                            Navigator.pop(context);
                                          }
                                   
                                });
                               },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5,bottom: 20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue,



                                  ),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(child: Icon(Icons.edit,color: Colors.white,size: 17,),),
                                        SizedBox(width: 5,),
                                        Container(child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: 16),),)
                                      ],
                                    ),
                                      
                                  ),
                                  
                                ),
                            
                            )
                  ])),
                  ]))));
  }
}
