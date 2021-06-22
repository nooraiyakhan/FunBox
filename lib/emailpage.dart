import 'package:flutter/material.dart';
class Emailpage extends StatefulWidget {
  @override
  _EmailpageState createState() => _EmailpageState();
}

class _EmailpageState extends State<Emailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
      
        children: <Widget>[
          Container(
            height: 300,
            width: 400,
        child: Image.asset("assets/code.jpg"),
          ),
          Container(
            child: Text("Enter the verification code",style: TextStyle(color: Colors.grey[700],fontSize: 13,fontWeight: FontWeight.w300),),

          ),
            Padding(padding: EdgeInsets.all(20)),
          Column(children: <Widget>[
            Container(
              // height: 100,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              
            
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "*Verification code",
                    hintStyle: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w300),
                  ),
                ),
              )
            ],

          ),
        ),
        ],
      ),
      
         ] ));
  }
}