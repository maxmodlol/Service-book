import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
//import 'dart:async';
//import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:mobtech/booking.dart';
import 'package:mobtech/main.dart';
import 'package:mobtech/translations.dart';

int ratingnow = 0;
final rate = TextEditingController();
final comment = TextEditingController();

class RatingsPage extends StatefulWidget {
  var indexnow;
  RatingsPage(this.indexnow);
  @override
  _RatingsPage createState() => _RatingsPage();
}

class _RatingsPage extends State<RatingsPage> {
  int _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Worker Rating")),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 50, 60, 10),
                  child: Rating((rating) {
                    setState(() {
                      _rating = rating;
                      ratingnow = rating;
                    });
                  }, 5)),
              SizedBox(
                  height: 24,
                  child: (_rating != null && _rating != 0)
                      ? Text("You selected $_rating rating",
                          style: TextStyle(fontSize: 13))
                      : SizedBox.shrink()),
              Padding(
                padding: const EdgeInsets.all(45.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, bottom: 50.0, right: 100.0),
                    child: new TextField(
                      controller: comment,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Your comment if you have any ',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                color: Colors.grey.shade800,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                minWidth: 100.0,
                onPressed: () {
                  finishrate();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => booking(user)));
                },
                child: Text(
                  Translations.of(context).done,
                ),
              )
            ],
          ),
        ));
  }
}

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  Rating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        Icons.star,
        color: Colors.orange,
        size: 45,
      );
    } else {
      return Icon(
        Icons.star_border_outlined,
        size: 45,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          this.widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: stars,
        ),
        FlatButton(
          child: Text("Clear", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            setState(() {
              _currentRating = 0;
            });
            this.widget.onRatingSelected(_currentRating);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

Future finishrate() async {
  var jsonResponse = null;
  var jsonResponse2 = null;
  int coustmerid = 0;
  int workerid = 0;
  int userid = userentery["id"];
  print("hi");
  var x = nameshere[indexx];
  http.Response response1 =
      await http.get("http://192.168.1.105:3000/getresult/$x");
  jsonResponse = jsonDecode(response1.body);
  var id = jsonResponse["id"];
  http.Response response3 =
      await http.get("http://192.168.1.105:3000/ratingupdate/$ratingnow/$id");
}
