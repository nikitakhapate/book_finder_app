
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class API_Manager extends StatefulWidget {
  API_Manager({Key key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<API_Manager> {
  Map link ;
  List itemslist;
  Future fetchdata() async{
    final response = await http.get('https://www.googleapis.com/books/v1/volumes?q='+nameController.text);
    if(response.statusCode==200){
      setState(() {
        link=json.decode(response.body);
        itemslist=link['items'];
      });
    }
  }
  @override
  void initState(){
    fetchdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
          appBar: AppBar(title: Text(nameController.text,style: TextStyle(fontWeight:FontWeight.bold ,
              fontSize: 20),),
          ),
          body:
          link==null?Container():card()


      ) ;
  }

  card() {
    final ScrollController _scrollController = ScrollController();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: Container(

        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(


          child: Expanded(
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,

              // scrollDirection: Axis.horizontal,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                String url=itemslist[index]['volumeInfo']['imageLinks']['smallThumbnail'].toString();

                return

                  Flexible(
                    child: InkWell(

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                              url,
                              //  height: 50,
                              // width:50,
                              // // width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  // Image.network(itemslist[index]['VolumeInfo']['imageLinks']['smallThumbnail']),
                                  Row(
                                    children: [
                                      // Text(url),

                                      Flexible(
                                        child: Text(    itemslist[index]['volumeInfo']['title'].toString(),style: TextStyle(fontWeight:FontWeight.bold ,
                                            fontSize: 20),
                                        ),
                                      ),],
                                  ),

                                  Row(
                                    children: [
                                      // Text("authors:"),

                                      Text(   itemslist[index]['volumeInfo']['authors'].toString(),style: TextStyle(
                                          fontSize: 10),
                                      ),

                                    ],
                                  ),
                                  RaisedButton(
                                    // padding: EdgeInsets.symmetric(horizontal: 100.0),
                                    child: Flexible(child: new Text("preview book")),
                                    color: Colors.purple,
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    onPressed:()async {
                                      String url = itemslist[index]['volumeInfo']['previewLink'];
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },

                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(20),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //     children: <Widget>[
                                  //       // Row(
                                  //       //   children: <Widget>[
                                  //       //     Icon(Icons.category),
                                  //       //     SizedBox(width: 6),
                                  //       //     Text(category),
                                  //       //   ],
                                  //       // ),
                                  //       Row(
                                  //         children: <Widget>[
                                  //           Icon(Icons.pages),
                                  //
                                  //
                                  //           Text(  itemslist[index]['volumeInfo']['pageCount'].toString()),
                                  //         ],
                                  //       ),
                                  //       Row(
                                  //         children: <Widget>[
                                  //           Icon(Icons.monetization_on_sharp),
                                  //
                                  //           // Text( itemslist[index]['SaleInfo']['buyLink']),
                                  //         ],
                                  //       ),
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  );
              },
              itemCount:itemslist==null?0:itemslist.length,

            ),
          ),
        ),
      ),
    );
  }
}
