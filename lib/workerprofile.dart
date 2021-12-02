import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobtech/booking.dart';
import 'package:mobtech/calender.dart';
import 'package:mobtech/category.dart';
import 'package:mobtech/main.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/workers.dart';
import 'package:scoped_model/scoped_model.dart';

class workerProfile extends StatefulWidget {
  @override
  _workerprofile createState() => _workerprofile();
}

class _workerprofile extends State<workerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView(children: <Widget>[
            Container(
              child: Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //
                    Padding(
                      padding:
                          EdgeInsets.only(right: 2, left: 1, top: 1, bottom: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profilPage(idhere,)),
                                );
                              }),
                        ],
                      ),
                    ),
                    //
                    //for user profile header
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 32, top: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/worker.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontFamily: "Roboto",
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "plumber",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontFamily: "Roboto",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.call,
                            color: Colors.blue,
                            size: 40,
                          )
                        ],
                      ),
                    ),

                    //performace bar

                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(32),
                      color: Colors.blue,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "234",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                        fontSize: 24),
                                  )
                                ],
                              ),
                              Text(
                                Translations.of(context).jobsdone,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: 15),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                        fontSize: 24),
                                  )
                                ],
                              ),
                              Text(
                                Translations.of(context).rating,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    //container for about me

                    Container(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: <Widget>[
                          Text(
                            Translations.of(context).aboutme,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Hello, this is maaz, and I am from easy approach, and this is just a demo text for information about me"
                            "Hello, this is maaz, and I am from easy approach, and this is just a demo text for information about me",
                            style:
                                TextStyle(fontFamily: "Roboto", fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      height: 250,
                      child: Carousel(
                        boxFit: BoxFit.cover,
                        images: [
                          AssetImage('images/plumb1.jpg'),
                          AssetImage('images/elec1.jpg'),
                          AssetImage('images/plumb1.jpg'),
                          AssetImage('images/elec1.jpg'),
                          AssetImage('images/plumb1.jpg'),
                        ],
                        autoplay: false,
                        // animationCurve: Curves.fastOutSlowIn,
                        //  animationDuration: Duration(milliseconds: 1000),
                        dotSize: 4.0,
                        indicatorBgPadding: 6.0,
                        dotBgColor: Colors.transparent,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 50),
                    // constraints: BoxConstraints.expand(height: 200),
                    //child: imageSlider(context)),

                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 100.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DateTimePicker()));
                              },
                              //=> print("HIRED"),
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    Translations.of(context).shedule,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //Container for reviews

                    Container(
                      padding: EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: <Widget>[
                          Text(
                            Translations.of(context).review,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 64,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Client $index",
                                            style: TextStyle(
                                                color: Colors.lightBlue,
                                                fontSize: 18,
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w700)),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("He is very fast and good at his work",
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 14,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                );
                              },
                              itemCount: 8,
                              shrinkWrap: true,
                              controller:
                                  ScrollController(keepScrollOffset: false),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // );
              //},
            )
          ]),
        )
      ],
    ));
  }
}

Swiper imageSlider(context) {
  return new Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return new Image.asset(
        'images/plumb1.jpg',
        fit: BoxFit.fitHeight,
      );
    },
    itemCount: 10,
    viewportFraction: 0.8,
    scale: 0.9,
  );
}

Widget _getBody(int index) {
  switch (index) {
    case 0:
      appbar1 = 'Category';
      return ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => Scaffold(
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
      appbar1 = "Case2";

      return workerProfile();
    case 3:
      return Center(
        child: Text("There is no page builder for this index."),
      );
  }
}
