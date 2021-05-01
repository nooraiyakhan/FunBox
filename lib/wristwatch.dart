import 'package:flutter/material.dart';
class Wristwatch extends StatefulWidget {
  @override
  _WristwatchState createState() => _WristwatchState();
}

class _WristwatchState extends State<Wristwatch> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child:new Text("mobile page",style:new TextStyle(color: Colors.orangeAccent,fontSize: 10)),
      ),);
  }
}