import 'package:flutter/material.dart';
import 'package:second_project/spash_screen.dart';

void main() => runApp(MyApp());

Color mainheader = Colors.blue;
Color subheader = Colors.lightBlue;
Color subwhite = Color(0xFFf4f4f4);
Color golden = Color(0xFFCFB53B);

String pageDirect = "";
int selectedPage = 0;

String address = "Choose address";
String name = '';
String phone = '';
String email = '';

int lastId = 0;
int favLastId = 0;
int cartLastID = 0;
int orderLastID = 0;
int profileLastID = 0;
List itemList = [];
List userProfileList = [];
List userOrderList = [];
List userCartList = [];
List userAddressList = [];
List userFavouriteList = [];
List userList = [];

String ip = "http://192.168.0.105";

String ipAddress = ip + "/Funbox/mobilelistdetails.php";
String ipAddress1 = ip + "/Funbox/laptopdetails.php";
String ipAddress2 = ip + "/Funbox/watchdetails.php";
String ipAddress3 = ip + "/Funbox/address.php";
String ipAddress4 = ip + "/Funbox/cart_details.php";
String ipAddress5 = ip + "/Funbox/favouritepage.php";
String ipAddress6 = ip + "/Funbox/orderdetails.php";
String ipAddress7 = ip + "/Funbox/profilepage.php";
String ipAddress8 = ip + "/Funbox/vouchers.php";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: subheader,
      ),
      home: SplashScreen(),
      //routes: routes,
    );
  }
}
