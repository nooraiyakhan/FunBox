import 'package:flutter/material.dart';
class Laptop extends StatefulWidget {
  @override
  _LaptopState createState() => _LaptopState();
}

class _LaptopState extends State<Laptop> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child:new Text("mobile page",style:new TextStyle(color: Colors.orangeAccent,fontSize: 10)),
      ),);
  }
}