
import 'package:flutter/material.dart';

class offeredjobs extends StatefulWidget {
  @override
  _profilPageState createState() => _profilPageState();
}

class _profilPageState extends State<offeredjobs> {
  TextEditingController _textController = TextEditingController();
  static List<String> mainDataList = [
    "A A",
    "B B",
    "C C",
    "D D",
    "E E",
    "F F",
    "R R",
    "K K",
    "L L",
    "M M"
  ];
  List<String> newDataList = List.from(mainDataList);

  List names = [
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
    "customer name",
  ];
  List date = [
    "date",
    "date",
    "date",
    "date",
    "date",
    "date",
    "date",
    "date",
    "date",
    "date",
  ];
  List<Map<String, IconData>> _services = [
    {
      'icon': Icons.plumbing,
      // 'color': Colors.red
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.format_paint,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
    {
      'icon': Icons.home_repair_service,
    },
  ];
  List time = [
    "time",
    "time",
    "time",
    "time",
    "time",
    "time",
    "time",
    "time",
    "time",
    "time",
  ];

  String appbar1 = 'job offers';
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text("Hello Appbar"),
    );
    return new Scaffold(
        appBar: AppBar(
          title: Text(appbar1),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
            color: Colors.blue[200],
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(names[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  date[index],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  time[index],
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: 5.0),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  _services[index]['icon'],
                                  color: Colors.blue,
                                  size: 35,
                                ),
                                SizedBox(width: 10.0),
                                //  Text(_services[index]['name']),
                              ],
                            ),
                          ),
                          /*
                        child: IconButton(
                              icon: Icon(Icons.plumbing),
                              color: Colors.blue,
                              iconSize: 40,
                              onPressed: () => print("tap")
                              /* {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SettingsUI()),
                                    );
                                  }*/
                              ),*/

                          /*  FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => workerProfile()));
                              },
                              color: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                "choose",
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
