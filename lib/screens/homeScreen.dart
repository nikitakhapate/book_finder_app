
import 'package:flutter/material.dart';
import 'package:mEvx/main.dart';

import 'secondScreen.dart';
class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}


class HomeScreenState extends State<HomeScreen> {

   final nameController = TextEditingController();



  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(title:  Text("BOOK FINDER",
        style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),),

      body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Image.network(
                    'https://www.adazing.com/wp-content/uploads/2019/02/open-book-clipart-03.png',
                    //  height: 50,
                    // width:50,
                    // // width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 50.0,),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius:BorderRadius.circular(20.0)),
                        hintText: "enter the book",
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)
                    ),

                    // onChanged listener listens to every change to textfield
//              onChanged: (text){
//                print(text);
//              },

                  ),
                  SizedBox(height: 10.0,),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    child: new Text("SEARCH"),
                    color: Colors.purple,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: (){
                      //   Navigator.of(context).push(
                      //      MaterialPageRoute(
                      //           builder: (context)
                      //         => API_Manager(nameController.text)
                      //     )
                      // );

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => API_Manager( )));
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => API_Manager()));
                      print(nameController.text);

                    },

                  ),

                ],
              ),
            ],
          )
      ),
    );
  }
}