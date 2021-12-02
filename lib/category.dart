import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobtech/booking.dart';
import 'package:mobtech/detailsClean.dart';
import 'package:mobtech/detailsElec.dart';
import 'package:mobtech/detailsLaund.dart';
import 'package:mobtech/detailsP.dart';
import 'package:mobtech/detailsPaint.dart';
import 'package:mobtech/detailsRep.dart';
import 'package:mobtech/main.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/translations_delegate.dart';
import 'package:mobtech/workerprofile.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

String appbar1 = 'Categorey';
int idhere = -1;

class MyAp extends StatefulWidget {
  var user;
  MyAp(this.user);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAp> {
  int _bottomNavIndex = 0;
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
            onGenerateTitle: (BuildContext context) =>
                Translations.of(context).title,
            localizationsDelegates: [
              const TranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: model.appLocal,
            supportedLocales: model.supportedLocales,
            home: Scaffold(
              bottomNavigationBar: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.lightBlueAccent,
                currentIndex: _selectedIndex,
                onTap: (value) => setState(() => _selectedIndex = value),
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
              appBar: AppBar(
                title: Text(appbar1),
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
              backgroundColor: Colors.blue[50],
              body: _getBody(_selectedIndex),
            )));
  }
}

class MyMenu1 extends StatelessWidget {
  MyMenu1({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => details(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

//

class MyMenu2 extends StatelessWidget {
  MyMenu2({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cleandetails(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

//
class MyMenu3 extends StatelessWidget {
  MyMenu3({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Repairdetails(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

class MyMenu4 extends StatelessWidget {
  MyMenu4({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Paintdetails(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

class MyMenu5 extends StatelessWidget {
  MyMenu5({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Elecdetails(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

class MyMenu6 extends StatelessWidget {
  MyMenu6({
    this.title,
    this.icon,
    this.warna,
    this.id,
  });

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          idhere = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Launddetails(user, idhere)));
        },
        splashColor: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

/*
Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      size: 70.0,
                    ),
                    Text("Home", style: new TextStyle(fontSize: 17))*/
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
                      id: 0,
                    ),
                    MyMenu2(
                      title: Translations.of(context).homecleaning,
                      icon: Icons.cleaning_services,
                      warna: Colors.brown,
                      id: 1,
                    ),
                    MyMenu3(
                        title: Translations.of(context).repaires,
                        icon: Icons.handyman,
                        warna: Colors.orange,
                        id: 2),
                    MyMenu4(
                        title: Translations.of(context).homepainting,
                        icon: Icons.format_paint_sharp,
                        warna: Colors.red,
                        id: 3),
                    MyMenu5(
                        title: Translations.of(context).electrican,
                        icon: Icons.electrical_services,
                        warna: Colors.green,
                        id: 4),
                    MyMenu6(
                        title: Translations.of(context).lunder,
                        icon: Icons.local_laundry_service,
                        warna: Colors.yellow,
                        id: 5),
                    MyMenu1(
                        title: Translations.of(context).covid,
                        icon: Icons.medical_services_outlined,
                        warna: Colors.pink,
                        id: 6),
                    MyMenu1(
                        title: Translations.of(context).movinghome,
                        icon: Icons.home_filled,
                        warna: Colors.grey,
                        id: 7),
                  ],
                ),
              )));
    // Create this function, it should return your first page as a widget
    case 1:
    nameshere.clear();
      designtionshere.clear();
      
      Future.delayed(const Duration(milliseconds: 500), () {
// Here you can write your code
        gettingdata();
      });
      

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
