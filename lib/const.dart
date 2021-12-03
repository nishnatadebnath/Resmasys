import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menuData.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cartData.dart';

class Global_var {
  static var cart_list = new List(1);
  static var item_price = new List(1);
  static String custId = '13579';
  static String tableNo = '10';
  static User user;
  static List<CartData> cart = [];
}

const Color kgreyletter = Color(0XFFA6ACBE);
const Color kgreyprofile = Color(0xFFEBEBEB);
const Color kbluecolor = Color(0XFF00B2FF);

TextStyle kTextStyleGrey({double size, FontWeight weight}) {
  return TextStyle(
    fontWeight: weight,
    fontSize: size,
    color: kgreyletter,
    fontFamily: 'Gilroy',
  );
}

TextStyle kTextStyleBlack({double size, FontWeight weight}) {
  return TextStyle(
    fontWeight: weight,
    fontSize: size,
    color: Colors.black,
    fontFamily: 'Gilroy',
  );
}
