
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import '../provider/favoriteProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import '../main.dart';


class favprite extends StatefulWidget {
  // API_Manager({Key key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<favprite> {
  Map link;
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
          appBar: AppBar(title: Text('favorite books',style: TextStyle(fontWeight:FontWeight.bold ,
              fontSize: 20),),
          ),
          body:
          link==null?Container():card()


      ) ;
  }

  card() {

    var favorite = Provider.of<CardModel>(context).selectedEventsIndex;
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
                String url=itemslist[favorite[index]]['volumeInfo']['imageLinks']['smallThumbnail'].toString();

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
                                        child: Text(    itemslist[favorite[index]]['volumeInfo']['title'].toString(),style: TextStyle(fontWeight:FontWeight.bold ,
                                            fontSize: 20),
                                        ),
                                      ),],
                                  ),

                                  Row(
                                    children: [
                                      // Text("authors:"),

                                      Text(  itemslist[favorite[index]].toString(),style: TextStyle(
                                          fontSize: 10),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RaisedButton(
                                        // padding: EdgeInsets.symmetric(horizontal: 100.0),
                                        child: Flexible(child: new Text("preview book")),
                                        color: Colors.purple,
                                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        onPressed:()async {
                                          String url = itemslist[favorite[index]]['volumeInfo']['previewLink'];
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },

                                      ),
                                      IconButton(
                                        icon: Icon(Icons.remove_circle_outline,), onPressed: () {
                                        Provider.of<CardModel>(context,listen: false).removecollege(favorite[index]);
                                        //  onLikeButtonTapped(index,context);
                                        print(index);
                                        final snackBar = SnackBar(content: Text('$index removed from Favorite list'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                                        Scaffold.of(context).showSnackBar(snackBar);
                                      },

                                      ),

                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        // Row(
                                        //   children: <Widget>[
                                        //     Icon(Icons.category),
                                        //     SizedBox(width: 6),
                                        //     Text(category),
                                        //   ],
                                        // ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.pages),


                                            Text(  itemslist[favorite[index]]['volumeInfo']['pageCount'].toString()),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.monetization_on_sharp),

                                            // Text( itemslist[index]['SaleInfo']['buyLink']),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  );
              },
              itemCount:itemslist==null?0:favorite.length,

            ),
          ),
        ),
      ),
    );
  }
}
