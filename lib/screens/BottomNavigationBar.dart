
import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../provider/BottomNavigationBar.dart';
import '../provider/favoriteProvider.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';





class BottomNavigationBarExample extends StatefulWidget{
  @override
  _BottomNavigationBar createState() =>
      _BottomNavigationBar();
// TODO: implement createSt




}

class _BottomNavigationBar extends State<BottomNavigationBarExample> {

  var currentTab=[

    like(),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);


    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(201, 175, 152, 1),
        index: provider.currentIndex,
        onTap: (index) {
          //Handle button tap
          provider.currentIndex=index;
        },
        items: [
          CircleAvatar(child: Icon(Icons.favorite)),
          CircleAvatar(child: Icon(Icons.search_off)),
        ],

      ),

    );
  }
// TODO: implement build




}

class abc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,

        ),
      ),
    );
    // throw UnimplementedError();
  }

}

class like extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blueAccent,

        ),
      ),
    );
    // throw UnimplementedError();
  }

}