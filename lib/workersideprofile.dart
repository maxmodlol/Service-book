import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobtech/category.dart';
import 'package:mobtech/editWorkerpage.dart';
import 'package:mobtech/homeworkerpage.dart';
import 'package:mobtech/offeredJobs.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/singupworker.dart';
import 'package:mobtech/translations.dart';
import 'package:scoped_model/scoped_model.dart';

bool here = true;

class workersideProfile extends StatefulWidget {
  @override
  _workerprof createState() => _workerprof();
}

class _workerprof extends State<workersideProfile> {
  @override
  int photoIndex = 0;
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    here = false;
    setState(() {
      _selectedIndex = index;
    });
  }

  int _bottomNavIndex = 0;
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
                      title: new Text(Translations.of(context).profile),
                      icon: new Icon(Icons.person)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).notfication),
                      icon: new Icon(Icons.notifications)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).jobsdone),
                      icon: new Icon(Icons.group_work_sharp)),
                  new BottomNavigationBarItem(
                      title: new Text(Translations.of(context).home),
                      icon: new Icon(Icons.home))
                ],
              ),
              body: here
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView(children: <Widget>[
                            Container(
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.of(context).size.height),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    //
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 2, left: 1, top: 1, bottom: 1),
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
                                                          SignUpPageworker()),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                    //
                                    //for user profile header
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 32, top: 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "John Doe",
                                                  style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontFamily: "Roboto",
                                                      fontSize: 36,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  "plumber",
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontFamily: "Roboto",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // //
                                          IconButton(
                                              icon: Icon(Icons.edit),
                                              color: Colors.blue,
                                              iconSize: 40,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditProfilePage()),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),

                                    //performace bar

                                    SizedBox(
                                      height: 16,
                                    ),

                                    SizedBox(
                                      height: 16,
                                    ),
                                    //container for about me

                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 32, right: 32),
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
                                            style: TextStyle(
                                                fontFamily: "Roboto",
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
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
                                        dotSize: 4.0,
                                        indicatorBgPadding: 6.0,
                                        dotBgColor: Colors.transparent,
                                      ),
                                    ),

                                    SizedBox(
                                      height: 1,
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 80.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: InkWell(
                                              onTap: () => print('tapped'),
                                              /*{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DateTimePicker()));
                                  },*/
                                              //=> print("HIRED"),
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  color: Colors.blue,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    Translations.of(context)
                                                        .addworkpic,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
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

                                    SizedBox(
                                      height: 1,
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 80.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: InkWell(
                                              onTap: () //=> print('tapped'),
                                                  {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CheckBoxListTileDemo()));
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
                                                    Translations.of(context)
                                                        .editmycategory,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Container for reviews
                                  ],
                                ),
                              ),
                              // );
                              //},
                            )
                          ]),
                        )
                      ],
                    )
                  /* Container(
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
                              // icon: Icons.dry_cleaning,
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
                    )*/

                  ////////////

                  : _getBody(_selectedIndex),
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
                                padding: EdgeInsets.only(
                                    right: 2, left: 1, top: 1, bottom: 1),
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
                                                    SignUpPageworker()),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              //
                              //for user profile header
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 32, top: 1),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                    // //
                                    IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.blue,
                                        iconSize: 40,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfilePage()),
                                          );
                                        }),
                                  ],
                                ),
                              ),

                              //performace bar

                              SizedBox(
                                height: 16,
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
                                      style: TextStyle(
                                          fontFamily: "Roboto", fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 10,
                                // // space
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
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
                                  dotSize: 4.0,
                                  indicatorBgPadding: 6.0,
                                  dotBgColor: Colors.transparent,
                                ),
                              ),

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
                                        onTap: () => print('tapped'),
                                        /*{
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DateTimePicker()));
                                  },*/
                                        //=> print("HIRED"),
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                            child: Text(
                                              Translations.of(context)
                                                  .addworkpic,
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
                                        onTap: () //=> print('tapped'),
                                            {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckBoxListTileDemo()));
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
                                              Translations.of(context)
                                                  .editmycategory,
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
                              //Container for reviews
                            ],
                          ),
                        ),
                        // );
                        //},
                      )
                    ]),
                  )
                ],
              )));
    // Create this function, it should return your first page as a widget

    case 1:
      here = true;
      return Center(
        child: Text("There is no page builder for this index."),
      );
    //  return HomePage();

    case 2:
      here = true;

      return offeredjobs();
    case 3:
      here = true;
      return HomePage();
    // return Center(
    //  child: Text("There is no page builder for this index."),
    // );
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

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  List<CheckBoxListTileModel> checkBoxListTileModel;

  @override
  Widget build(BuildContext context) {
    // return Container(width: 0, height: 0);
    List<CheckBoxListTileModel> checkBoxListTileModel =
        CheckBoxListTileModel.getUsers(context);
    Container(width: 10, height: 10);
    return Scaffold(
        body: Column(children: <Widget>[
      new ListView.builder(
          shrinkWrap: true, // use it

          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        activeColor: Colors.blue,
                        dense: true,
                        //font change
                        title: new Text(
                          checkBoxListTileModel[index].title,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        onChanged: (bool val) {
                          itemChange(val, index);
                        }),
                  ],
                ),
              ),
            );
          }),
      new FlatButton(
        color: Colors.grey.shade800,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        minWidth: 100.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => workersideProfile()));
        },
        child: Text(
          Translations.of(context).done,
        ),
      ),
    ]));
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = true;
    });
  }
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers(context) {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1, title: Translations.of(context).plumber, isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          title: Translations.of(context).homecleaning,
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3, title: Translations.of(context).repaires, isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          title: Translations.of(context).homepainting,
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          title: Translations.of(context).electrican,
          isCheck: false),
      CheckBoxListTileModel(
          userId: 6, title: Translations.of(context).lunder, isCheck: false),
      CheckBoxListTileModel(
          userId: 7,
          title: Translations.of(context).movinghome,
          isCheck: false),
    ];
  }
}
