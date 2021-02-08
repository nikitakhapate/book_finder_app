
import 'dart:convert';
import 'package:mEvx/screens/favorite.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'provider/BottomNavigationBar.dart';
import 'provider/favoriteProvider.dart';
import 'screens/BottomNavigationBar.dart';
import 'screens/homeScreen.dart';

void main() => runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(
        create: (ctx) => BottomNavigationBarProvider(),
      ),
      // ChangeNotifierProvider(
      //   create: (ctx) => favorites_Provider(),
      // ),
      ChangeNotifierProvider(
        create: (ctx) => CardModel(),
      ),
      // ChangeNotifierProvider<BottomNavigationBarProvider>(
      //   child: BottomNavigationBarExample(),
      //   builder: (BuildContext context) => BottomNavigationBarProvider(),
      // ),
    ],
    child:  MyApp()));


final nameController = TextEditingController();


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BookFinder',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new HomeScreen(),
      // routes: <String, WidgetBuilder>{
      // 'list': (BuildContext context) => BooklistScreen(),
      // 'details': (BuildContext context) => FlightDetailScreen(),
      // },
      routes: <String, WidgetBuilder>{
        'list': (BuildContext context) => BottomNavigationBarExample(),
         'details': (BuildContext context) => favprite(),
      },
    );
  }
}

// final nameController = TextEditingController();

