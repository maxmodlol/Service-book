import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:http/http.dart' as http;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:mobtech/booking.dart';
import 'package:mobtech/category.dart';
import 'package:mobtech/main.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/workerprofile.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

/*class MyWorker extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: "profile list",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}*/
bool here = true;
List filteredUsers = List();
final List names = [];
final List designtions = [];
final List location = [];

class profilPage extends StatefulWidget {
  int id;
  profilPage(this.id);

  @override
  _profilPageState createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  int _bottomNavIndex = 0;
  @override
  void initState() {
    super.initState();

    setState(() {
      filteredUsers = names;
    });
  }

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    here = false;
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text("text"),
                backgroundColor: Colors.lightBlueAccent,
              ),
              drawer: MultiLevelDrawer(
                backgroundColor: Colors.white,
                rippleColor: Colors.white,
                subMenuBackgroundColor: Colors.grey.shade100,
                header: Container(
                  // Header for Drawer
                  height: size.height * 0.25,

                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/worker.jpg",
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("rania")
                    ],
                  )),
                ),
                children: [
                  // Child Elements for Each Drawer Item
                  MLMenuItem(
                      leading: Icon(Icons.person),
                      trailing: Icon(Icons.arrow_right),
                      content: Text(
                        Translations.of(context).myprofile,
                      ),
                      subMenuItems: [
                        MLSubmenu(
                            onClick: () {}, submenuContent: Text("Option 1")),
                        MLSubmenu(
                            onClick: () {}, submenuContent: Text("Option 2")),
                        MLSubmenu(
                            onClick: () {}, submenuContent: Text("Option 3")),
                      ],
                      onClick: () {}),
                  MLMenuItem(
                    leading: Icon(Icons.notifications),
                    content: Text(Translations.of(context).notfication),
                    onClick: () {},
                  ),
                  MLMenuItem(
                      leading: Icon(Icons.language),
                      trailing: Icon(Icons.arrow_right),
                      content: Text(
                        Translations.of(context).languages,
                      ),
                      subMenuItems: [
                        MLSubmenu(
                            onClick: () {},
                            submenuContent:
                                Text(Translations.of(context).english)),
                        MLSubmenu(
                            onClick: () {},
                            submenuContent:
                                Text(Translations.of(context).arabic)),
                      ],
                      onClick: () {}),
                ],
              ),
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
                  ? Container(
                      color: Colors.blue[200],
                      child: Column(children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              hintText: 'Filter by name or email',
                              hoverColor: Colors.red),
                          onChanged: (string) {
                            setState(() {
                              filteredUsers = names
                                  .where((u) => (u
                                          .toLowerCase()
                                          .contains(string.toLowerCase()) ||
                                      u
                                          .toLowerCase()
                                          .contains(string.toLowerCase())))
                                  .toList();
                            });
                          },
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: ListView.builder(
                              itemCount: filteredUsers.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0)),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 55.0,
                                                  height: 55.0,
                                                  //color: Colors.blue,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    foregroundColor:
                                                        Colors.blue,
                                                    backgroundImage: NetworkImage(
                                                        "https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png"),
                                                  ),
                                                ),
                                                SizedBox(width: 15.0),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(filteredUsers[index],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                      designtions[index],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RatingBar.builder(
                                                          initialRating: 1,
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemSize: 25.0,
                                                          itemPadding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            print(rating);
                                                          },
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(width: 5.0),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 10.0),
                                              child: FlatButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                workerProfile()));
                                                  },
                                                  color: Colors.blue[400],
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Text(
                                                    Translations.of(context)
                                                        .pickservice,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        ))
                      ]))
                  : _getBody(_selectedIndex),
            ));
  }
}

Widget searchBarUI() {
  return FloatingSearchBar(
    hint: 'Search.....',
    openAxisAlignment: 0.0,
    maxWidth: 600,
    axisAlignment: 0.0,
    scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
    elevation: 4.0,
    physics: BouncingScrollPhysics(),
    onQueryChanged: (query) {
      //Your methods will be here
    },
    transitionCurve: Curves.easeInOut,
    transitionDuration: Duration(milliseconds: 500),
    transition: CircularFloatingSearchBarTransition(),
    debounceDelay: Duration(milliseconds: 500),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: Icon(Icons.place),
          onPressed: () {
            print('Places Pressed');
          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          color: Colors.white,
          child: Container(
            height: 200.0,
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text('Home'),
                  subtitle: Text('more info here........'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class appbar extends StatefulWidget {
  @override
  appbarState createState() => appbarState();
}

class appbarState extends State<appbar> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('My Home Page'),
        actions: [searchBar.getSearchAction(context)]);
  }

  _MyHomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: searchBar.build(context));
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
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
      here = true;
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

Future categorytype() async {
  List jsonResponse = null;
  var jsonResponse2 = null;
  String service;
  String usernamee;
  print(idhere);
  http.Response response1 =
      await http.get("http://192.168.1.105:3000/getworkerstype/$idhere");
  jsonResponse = jsonDecode(response1.body);
  service = jsonResponse[0]["service"];
  print(service);
  for (int i = 0; i < jsonResponse.length; i++) {
    usernamee = jsonResponse[i]["username"];
    http.Response response2 =
        await http.get("http://192.168.1.105:3000/getworkers/$usernamee");
    if (response2.body.isNotEmpty && response2.body != "[]") {
      jsonResponse2 = jsonDecode(response2.body);
      String name = jsonResponse2["username"].toString();
      String locationn = jsonResponse2["city"].toString();
      print(name);
      print(locationn);
      names.add(name);
      designtions.add(service);
      location.add(locationn);
    }
  }
}
