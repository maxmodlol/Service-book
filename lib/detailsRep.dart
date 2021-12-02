import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobtech/booking.dart';
import 'package:mobtech/category.dart';
import 'package:mobtech/main.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/workerprofile.dart';
import 'package:mobtech/workers.dart';
import 'package:scoped_model/scoped_model.dart';

bool here = true;
var jsonResponshere = null;

class Repairdetails extends StatefulWidget {
  var user;
  int id;

  Repairdetails(this.user, this.id);
  @override
  _ClDetail createState() => _ClDetail();
}

class _ClDetail extends State<Repairdetails> {
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    here = false;
    setState(() {
      _selectedIndex = index;
    });
  }

  int photoIndex = 0;
  List<String> photos = ['images/rep1.jpg', 'images/rep2.jpg'];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
              bottomNavigationBar: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.lightBlueAccent,
                currentIndex: _selectedIndex,
                onTap: _onItemTap,
                items: [
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).home),
                      icon: new Icon(Icons.home)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).booking),
                      icon: new Icon(Icons.calendar_today)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).profile),
                      icon: new Icon(Icons.person)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).post),
                      icon: new Icon(Icons.post_add))
                ],
              ),
              body: here
                  ? ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 400.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(photos[photoIndex]),
                                          fit: BoxFit.cover)),
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 275.0,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.transparent,
                                  ),
                                  onTap: _nextImage,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 275.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    color: Colors.transparent,
                                  ),
                                  onTap: _previousImage,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(Icons.arrow_back),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyAp(user)),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 240.0,
                                    left:
                                        MediaQuery.of(context).size.width / 2 -
                                            30.0,
                                    child: Row(
                                      children: <Widget>[
                                        SelectedPhoto(
                                          numberOfDots: photos.length,
                                          photoIndex: photoIndex,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                Translations.of(context).repier_des,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15.0,
                                    color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                Translations.of(context).repier_motv,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Padding(
                                padding: EdgeInsets.only(left: 290.0),
                                child: FlatButton(
                                  onPressed: () {
                                    names.clear();
                                    designtions.clear();
                                    location.clear();
                                    categorytype();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                profilPage(idhere)));
                                  },
                                  child: Text(
                                      Translations.of(context).pickservice),
                                  color: Colors.blue[200],
                                )),
                          ],
                        )
                      ],
                    )
                  : _getBody(_selectedIndex),
            ));
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(4.0))),
      ),
    );
  }

  Widget _activePhoto() {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5, top: 130, bottom: 130),
        child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
                ])),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildDots(),
    ));
  }
}

Widget _getBody(int index) {
  switch (index) {
    case 0:
      here = true;

      return ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text(appbar1),
                backgroundColor: Colors.lightBlueAccent,
              ),
              body: Container(
                padding: EdgeInsets.all(30),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    MyMenu1(
                      title: Translations.of(context).plumber,
                      icon: Icons.plumbing,
                      warna: Colors.blue,
                    ),
                    MyMenu2(
                        title: Translations.of(context).homecleaning,
                        icon: Icons.cleaning_services,
                        warna: Colors.brown),
                    MyMenu3(
                        title: Translations.of(context).repaires,
                        icon: Icons.handyman,
                        warna: Colors.orange),
                    MyMenu4(
                        title: Translations.of(context).homepainting,
                        icon: Icons.format_paint_sharp,
                        warna: Colors.red),
                    MyMenu5(
                        title: Translations.of(context).electrican,
                        icon: Icons.electrical_services,
                        warna: Colors.green),
                    MyMenu6(
                        title: Translations.of(context).lunder,
                        icon: Icons.local_laundry_service,
                        //icon: Icons.dry_cleaning,
                        warna: Colors.yellow),
                    MyMenu1(
                        title: Translations.of(context).covid,
                        icon: Icons.medical_services_outlined,
                        warna: Colors.pink),
                    MyMenu1(
                        title: Translations.of(context).movinghome,
                        icon: Icons.home_filled,
                        warna: Colors.grey),
                  ],
                ),
              )));
    // Create this function, it should return your first page as a widget

    case 1:
      return booking(user);
    case 2:
      here = true;

      return workerProfile();
    case 3:
      here = true;
      return Center(
        child: Text("There is no page builder for this index."),
      );
  }
}

Categorytype() async {
  http.Response response1 =
      await http.get("http://192.168.1.66:3000/getworkerstype/$idhere");

  jsonResponshere = jsonDecode(response1.body);
}
