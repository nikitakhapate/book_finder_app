
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'screens/homeScreen.dart';

void main() => runApp(new MyApp());


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
        'list': (BuildContext context) => HomeScreen(),
        // 'details': (BuildContext context) => FlightDetailScreen(),
      },
    );
  }
}

// final nameController = TextEditingController();

