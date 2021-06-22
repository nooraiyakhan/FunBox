import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/loginpage.dart';
class EditpasswordPage extends StatefulWidget {
  @override
  _EditpasswordPageState createState() => _EditpasswordPageState();
}

class _EditpasswordPageState extends State<EditpasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon:Icon(Icons.chevron_left,color: Colors.blue,)
          
          , onPressed: ()=>Navigator.of(context).pop(),),
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              Container(
                padding: EdgeInsets.only(right: 170),
                child: Text("Edit Password",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.w300,fontSize: 17,),
              ),
               ) ],
          )
        ],
      ), 
      body: 
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: 20,),
           Container(
             margin: EdgeInsets.only(top: 5,left: 10,right: 10),
             padding: EdgeInsets.only(left: 10,right: 10),
             decoration: BoxDecoration(
               color: Colors.grey[100],
               border: Border.all(width: 0.1),
               borderRadius: BorderRadius.circular(7)
              
             ),
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Type Old Password",
                 hintStyle: TextStyle(
                   color: Colors.black54,
                   fontSize: 15,
                 ),
                 labelText: "Enter Old Password",labelStyle: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.w300
                 ),
             border: InputBorder.none  ),
               
              

             ),
            
           ),
           SizedBox(height:15,),
            Container(
             margin: EdgeInsets.only(top: 5,left: 10,right: 10),
             padding: EdgeInsets.only(left: 10,right: 10),
             decoration: BoxDecoration(
               color: Colors.grey[100],
               border: Border.all(width: 0.1),
               borderRadius: BorderRadius.circular(7)
              
             ),
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Type New Password",
                 hintStyle: TextStyle(
                   color: Colors.black54,
                   fontSize: 15,
                   fontWeight: FontWeight.w300
                 ),
                 labelText: "Enter New Password",labelStyle: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.w300
                 ),
             border: InputBorder.none  ),
               
              

             ),
            
           ),
           SizedBox(height: 15,),
             Container(
             margin: EdgeInsets.only(top: 5,left: 10,right: 10),
             padding: EdgeInsets.only(left: 10,right: 10),
             decoration: BoxDecoration(
               color: Colors.grey[100],
               border: Border.all(width: 0.1),
               borderRadius: BorderRadius.circular(7)
              
             ),
             child: TextField(
               decoration: InputDecoration(
                 hintText: "Type Password Again..",
                 hintStyle: TextStyle(
                   color: Colors.black54,
                   fontSize: 15,
                   fontWeight: FontWeight.w300
                 ),
                 labelText: "Confirm Password",labelStyle: TextStyle(
                   color: Colors.blue,
                   fontWeight: FontWeight.w300
                 ),
             border: InputBorder.none  ),
               
              

             ),
            
           ),
           Container(
             margin: EdgeInsets.only(left: 15,right: 15,top: 10),
               child:RaisedButton(
               color: Colors.blue,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10) ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 padding: EdgeInsets.only(top:5,bottom: 5 ),
                 child: Icon(Icons.edit,color: Colors.white,size: 17,),
               ),
               SizedBox(width: 5,),
               Container(
                   padding: EdgeInsets.only(top:5,bottom: 5 ), child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300),),
               ) ],   ),   onPressed: (){
                    showDialog(context: context,
                    builder: (BuildContext context)=>CupertinoAlertDialog(
                    content: Image.asset("assets/passreset.jpg"),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child:Text("Done",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w300),),
                          onPressed: (){
                            print("Done",);
                            Navigator.push(context, 
                           MaterialPageRoute(builder: (context)=>Loginpage()));},)],));}, ) ) ], ),),
    );
  }
}