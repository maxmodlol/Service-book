import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobtech/main.dart';
import 'package:mobtech/stars.dart';

var indexx;
final List nameshere = [];
final List designtionshere = [];

class booking extends StatefulWidget {
  final user;

  booking(this.user);
  @override
  _bookingPageState createState() => _bookingPageState();
}

class _bookingPageState extends State<booking> {
  TextEditingController _textController = TextEditingController();
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: Container(
            color: Colors.blue[200],
            child: ListView.builder(
              itemCount: nameshere.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/worker.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nameshere[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  designtionshere[index],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                            //  SizedBox(width: 5.0),
                          ],
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 30),
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.star_outline),
                              label: Text("Rate"),
                              onPressed: () {
                                getindex(index);
                                indexx = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RatingsPage(index)));
                              },
                              style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(width: 2.0, color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            )
                            /*  child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => workerProfile()));
                              },
                              color: Colors.blue[600],
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "rate",
                                style: TextStyle(color: Colors.white),
                              )),*/
                            ),
                        //  SizedBox(width: 5.0),
                        Container(
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.delete),
                              label: Text("delete"),
                              onPressed: () => print("it's pressed"),
                              style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(width: 2.0, color: Colors.blue),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            )

                            /*  child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => workerProfile()));
                              },
                              color: Colors.red[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "delete",
                                style: TextStyle(color: Colors.white),
                              )),*/
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}

showdata() async {
  var jsonRespons = null;

  http.Response response =
      await http.get("http://192.168.1.228:3000/getresult/");

  jsonRespons = jsonDecode(response.body);
}

int getindex(int g) {
  return g;
}

Future gettingdata() async {
  List jsonResponse = null;
  var jsonResponse2 = null;
  int coustmerid = 0;
  int workerid = 0;
  int userid = userentery["id"];
  print("hi");

  print(userid);

  http.Response response1 =
      await http.get("http://192.168.1.105:3000/getbooking/$userid");
  jsonResponse = jsonDecode(response1.body);

  print(jsonResponse);
  for (int i = 0; i < jsonResponse.length; i++) {
    workerid = jsonResponse[i]["idworker"];
    print(workerid);
    http.Response response2 =
        await http.get("http://192.168.1.105:3000/getworkersbooking/$workerid");
    if (response2.body.isNotEmpty && response2.body != "[]") {
      jsonResponse2 = jsonDecode(response2.body);
      String name = jsonResponse2[0]["username"].toString();
      String job = jsonResponse[i]["servicetype"].toString();
      print(name);
      nameshere.add(name);
      designtionshere.add(job);
    }
  }
}
