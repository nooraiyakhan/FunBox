import 'package:flutter/material.dart';
import 'package:second_project/order.dart';
class Orderdetailspage extends StatefulWidget {
@override
  _OrderdetailspageState createState() => _OrderdetailspageState();
}

class _OrderdetailspageState extends State<Orderdetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        actions: [
          
        new Container(
           child:Text("Order Details",style: TextStyle(fontSize: 16,color: Colors.grey[600],fontWeight: FontWeight.w300),),
           padding: EdgeInsets.only(top: 18,right: 200),
         ),
         
        ],
      ),
      
  body: SafeArea(child: 
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
    
      child:new Container(
       
    // Container(
        child: Column(
          children: [
            Container(
               margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(5)),
                    child: 
                    Column(   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Order Information",style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300),),
                        ),
                        
                         SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Status",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                          Container(
                             child: Row(
                               children: [
                                 
                                  Container(
                              child: Icon(Icons.done,size: 15,color: Colors.blue,),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                child: Text("Deliverd",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w300),),
                              )
                               ],
                             ) )  
          ], ),
        SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Order Number",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                          Container(
                             child: Container(
                               child: Text("#f5qdb",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                             ) )  
          ],),
    ]
    )
    ),
     Column(
          children: [
            Container(
               margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(5)),
                    child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Order Pricing",style:TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300),),
                        ),
                        SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Total Price",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                          Container(

                             child:
                             Row(
                               children: [
                            
                              Container(
                                child: Text("5000.0/-",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              )
                               ],
                             )

                              
                          )],
        ),
         SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("No. Of Product",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                           Container(
                               child: Text("4",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w300),),
                             )  
          ], ),
       
        SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Discount",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                                Container(
                             child: Row(
                               children: [
                                 Container(
                                   child: Text("-",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.w300),),
                                 ),
                                 
                              Container(
                                child: Text("500.0/-",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w300),),
                              )
                               ],
                             ) ) 
                              
                     
          ],   ),
        SizedBox(height: 22,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Delivery charge",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                           Container(
                             child: Row(
                               children: [
                                
                                 
                              Container(
                                child: Text("200.0/-",style: TextStyle(color: Colors.grey,fontSize: 15),),
                              )
                               ],
                             ) )  
          ],
            ),
            SizedBox(height: 10,),
          Divider(),
          SizedBox(height:5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text("Total Payable",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
                              ),
                           Container(
                             child: Row(
                               children: [
                                
                               
                              Container(
                                child: Text("4700.0/-",style: TextStyle(color: Colors.black,fontSize: 15),),
                              )
                               ],
                             ) ), ],  ),
         ],  ),
          ),
            Container(
       margin: EdgeInsets.only(left: 15, right: 15, top:5, bottom:5),
                padding: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(5)),
                    child: 
                    Column  (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("Deliver To ",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w300),),
                          ),
                         ],
        ), 
        SizedBox(height: 20,),
             Container(
               padding: EdgeInsets.only(bottom: 5),
               child: Text("John Smitha",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w300),),
             ),
     SizedBox(height: 10,),

        Row(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child:Icon(Icons.location_on,color: Colors.grey,size: 17,)
                              ),
                              SizedBox(width: 10,),
                                Container(
                             child: Row(
                               children: [
                                 Container(
                                  // padding: EdgeInsetsDirectional.only(end: 165),
                                   child: Text("New York,USA",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w300),)
                                 ),
                             
                               ],
                             ) ) 
                              
                     
          ],   ),

           SizedBox(height: 40,),
             Container(
               padding: EdgeInsets.only(bottom: 5),
               child: Text("Delivery Date",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w300),),
             ),
     SizedBox(height: 10,),

        Row(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child:Icon(Icons.calendar_today_rounded,color: Colors.grey,size: 17,)
                              ),
                              SizedBox(width: 10,),
                                Container(
                             child: Row(
                               children: [
                                 Container(
                                  // padding: EdgeInsetsDirectional.only(end: 165),
                                   child: Text("08-11-2020",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),)
                                 ),
                                 SizedBox(width: 155,),
                             
                               ],
                             ) ) 
                             ],),
    ],
    ),),
          ]),
              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context)=>Orderpage())
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 20,left: 20,right: 20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                       
                                        SizedBox(
                                          width: 5,
                                        ),
                                      
                                         Container(
                                            
                                            child: Text(
                                              "Reorder",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,fontWeight: FontWeight.w300),
                                            ),
                                            
                                            
                                          ),


                                        
                                        Container(
                                          child:Icon(Icons.arrow_right,size: 17,color: Colors.white,) ,
                                     )
                                      ],
                                    ),
                                  ),
                                ),
                              )
          ])
          ),
          
          )
          ));
  }
}