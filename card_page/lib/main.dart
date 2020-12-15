import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: SafeArea(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/chad.jpg'),
                ),
                Text(
                  'Joseph K.',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontFamily: 'Opensans',
                    fontSize: 22,
                    color: Colors.teal[100],
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Divider(color: Colors.teal[100], thickness:1.5,),
                  ),
                Container(
                  //margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Card(
                    child: ListTile(
                        leading: Icon(Icons.phone,color: Colors.black),
                        title: Text(
                          '+234-814-3456-786',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                
                Container(
                  //margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.email_rounded, color: Colors.black,),
                      title: Text(
                        'ghostedcode@gmail.com',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}