import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'pages/home.dart';
import 'pages/contact.dart';
import 'pages/adduser.dart';
import 'pages/EditUser.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/contact': (context) => Contact(),
    '/adduser': (context) => AddUser(),
    '/edituser': (context) => EditUser(),

   }
  
  ));
}
