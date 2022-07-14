import 'package:flutter/material.dart';

//text in app
class ProjectText {
  static String signIn = "Sign in";
  static String signUp = "Sign up";
  static String email = "E-mail";
  static String password = "Password";
  static String appbarl = "Sign in";
  static String appbarr = "Sign up";
  static String categoryname = "Category Name";
  static String enterTask = "Enter Task";
  static String cancel = "Cancel";
  static String create = "Create";
}
//textstyle in app
class ProjectTextStyles {
  static TextStyle textformlabel =
      const TextStyle(fontSize: 17.0, color: Color(0xff393E46));
  static TextStyle cancelStyle =
      const TextStyle(color: Color(0xff393E46), fontSize: 16.0);
  static TextStyle createStyle =
      const TextStyle(color: kPrimaryColor, fontSize: 16.0);
  static TextStyle titledialog =
      const TextStyle(color: Color(0xff393E46), fontSize: 16.0);
  static const TextStyle sign =
      TextStyle(color: Color(0xffF9F9F9), fontSize: 18.0);
  static const TextStyle sbStyle =
      TextStyle(color: Color(0xffF9F9F9), fontSize: 16.0);
}

// Colos that use in our app
const kPrimaryColor = Color(0xff6927FF);
const kLightColor = Color(0xffFFFFFF);
const kSecondaryColor = Color(0xff7e6be8);
const kTextColor = Color(0xff393E46);
const kBorderColor = Color(0xffDADADA);

const kTextLightColor = Color(0xFF9A9BB2);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

//image in app
const String logoImg = "assets/images/logo.png";
