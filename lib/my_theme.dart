import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_m3aya/main.dart';

class MyImages {
  static const String appLogo = 'assets/images/logo.png';
  static const String novel = 'assets/images/novel.png';
}

class MyColors {
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color primaryColorDark = Color(0xFF166197);
  static const Color buttonColor = Colors.blue;
  static const accentColor = Colors.white;
  static const MaterialColor primarySwatch = Colors.blue;
}

class MyStyles {
  static TextStyle appBar = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle header = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: 'Alarabiya',
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle header_u = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    decoration:TextDecoration.underline,
    fontFamily: 'Alarabiya',
    color: Colors.black,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle body = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 10,
    color: Colors.black54,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle body_u = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 10,
    decoration:TextDecoration.underline,
    color: Colors.black54,
    overflow: TextOverflow.ellipsis,
  );
}
