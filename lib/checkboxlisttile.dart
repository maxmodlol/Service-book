
import 'package:flutter/material.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/signupworker2.dart';
import 'package:mobtech/singupworker.dart';
import 'package:mobtech/translations.dart';
import 'package:scoped_model/scoped_model.dart';

List<CheckBoxListTileModel> checkBoxListTileModel;

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Scaffold(
                body: Column(children: <Widget>[
              ListView.builder(
                  shrinkWrap: true, // use it

                  itemCount: checkBoxListTileModel.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Card(
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
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

                              onChanged: (bool val) {
                                setState(() {
                                  checkBoxListTileModel[index].isCheck = val;
                                });
                              },
                              value: checkBoxListTileModel[index].isCheck,
                            ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPageworker2(text)));
                },
                child: Text(
                  Translations.of(context).done,
                ),
              ),
            ])));
  }

  void itemChange(bool val, int index) {}
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(  userId: 0, title: "Translations.of(context).aboutme", isCheck: true),
      CheckBoxListTileModel(userId: 1, title: "y.homecleaning", isCheck: false),
      CheckBoxListTileModel(     userId: 2,
          title: "Translations.of(context).repaires",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          title: "Translations.of(context).homepainting",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          title: "Translations.of(context).electrican",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5, title: "Translations.of(context).lunder", isCheck: false),
      CheckBoxListTileModel(
          userId: 6,
          title: "Translations.of(context).movinghome",
          isCheck: false),
    ];
  }
}
