// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:mEvx/models/evxData.dart';
// import 'package:mEvx/screens/cart.dart';
//
import 'dart:collection';

import 'package:flutter/material.dart';


class CardModel extends ChangeNotifier{
  List<int>  _selectedBook=[];
  List <int> get selectedEventsIndex {
    return _selectedBook;
  }

  bool isLoading=false;
  bool isLiked=false;

  void addcollege (int value){
    isLoading =true;
    _selectedBook.add(value);
    notifyListeners();
    print(value);
  }
  void removecollege(int value) {
    _selectedBook.remove(value);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

}