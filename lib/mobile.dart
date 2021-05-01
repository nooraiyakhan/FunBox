import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child:new Text("mobile page",style:new TextStyle(color: Colors.orangeAccent,fontSize: 10)),
      ),
      
    );
  }
}