import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/singupworker.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/translations_delegate.dart';
import 'package:mobtech/workersideprofile.dart';
import 'package:scoped_model/scoped_model.dart';

final cdescption = TextEditingController();

class SignUpPageworker2 extends StatefulWidget {
  final List<String> text;
  SignUpPageworker2(this.text);

  @override
  _SignUpPageworker2State createState() => _SignUpPageworker2State();
}

List<CheckBoxListTileModel> checkBoxListTileModel;
Item selectedUser;

List<Item> users = <Item>[
  const Item('Nablus'),
  const Item('Ramallah'),
  const Item('Jenin'),
  const Item('Bethlahem'),
  const Item('Tulkarem'),
  const Item('Jericho'),
  const Item('Hebron'),
];
Future<File> file;
String status = '';
String base64Image;
File tmpFile;
String errMessage = 'Error Uploading Image';

List<String> tmpArray = [];

class _SignUpPageworker2State extends State<SignUpPageworker2> {
  @override
  Widget build(BuildContext context) {
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
              body: CustomPaint(
                painter: BackgroundSignUp(),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 5.0),
                      child: Column(
                        children: <Widget>[
                          _getHeader(context),
                          _getTextFields(context),
                          _getSignIn(context),
                          _getBottomRow(context),
                        ],
                      ),
                    ),
                    _getBackBtn()
                  ],
                ),
              ),
            )));
  }
}

_getBackBtn() {
  return Positioned(
    top: 35,
    left: 25,
    child: Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
    ),
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ),
  );
}

_getSignIn(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          Translations.of(context).signup,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: 25,
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    signupworker55();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => workersideProfile()));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

_getTextFields(context) {
  return Expanded(
    flex: 6,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12,
          width: 7.0,
        ),
        DropdownScreen(),
        SizedBox(
          height: 12,
          width: 7.0,
        ),
        new Theme(
          data: new ThemeData(
            primaryColor: Colors.black54,
            primaryColorDark: Colors.black54,
          ),
          child: TextField(
              controller: cdescption,
              maxLines: 5,
              decoration: new InputDecoration(
                hintText: Translations.of(context).talkabouturself,
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.black54),
                ),
              )),
        ),
        SizedBox(
          height: 12,
          width: 7.0,
        ),
        UploadPage(),
        SizedBox(
          height: 12,
          width: 7.0,
        ),
        FlatButton(
          color: Colors.grey.shade800,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          minWidth: 400.0,
          onPressed: () {
            tmpArray.clear();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckBoxListTileDemo()));
          },
          child: Text(
            Translations.of(context).categoryy,
          ),
        ),
      ],
    ),
  );
}

_getHeader(context) {
  return Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        Translations.of(context).createaccount,
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    ),
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.55, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class Item {
  const Item(this.name);
  final String name;
}

class DropdownScreen extends StatefulWidget {
  State createState() => DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      hint: Text(Translations.of(context).city),
      value: selectedUser,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      underline: Container(
        height: 1,
        color: Colors.white,
      ),
      onChanged: (Item Value) {
        setState(() {
          selectedUser = Value;
        });
      },
      items: users.map((Item user) {
        return DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                user.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<String> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  String state = "";

  @override
  Widget build(BuildContext context) {
    String username = cusername.text;

    return Column(children: <Widget>[
      FloatingActionButton(
        onPressed: () async {
          var file = await ImagePicker.pickImage(source: ImageSource.gallery);
          var res = await uploadImage(
              file.path, 'http://192.168.1.66:3000/upload/$username');
          setState(() {
            state = res;
            print(res);
          });
        },
        child: Icon(Icons.add_a_photo_sharp),
      ),
    ]);
  }
}

class UploadImageDemo extends StatefulWidget {
  UploadImageDemo() : super();

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
  UploadImageDemo.startUpload();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  final String uploadEndPoint = 'http://192.168.1.66::3000/store-image';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        OutlineButton(
          onPressed: chooseImage,
          child: Text(Translations.of(context).uploadimage),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class CheckBoxListTileDemo extends StatefulWidget {
  List<CheckBoxListTileModel> checkBoxListTileModel = [];
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  final checkBoxListTileModel = CheckBoxListTileModel.getUsers();
  @override
  Widget build(BuildContext context) {
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
                                  if (checkBoxListTileModel[index].isCheck ==
                                      true) {
                                    tmpArray.add(
                                        checkBoxListTileModel[index].title);
                                  }
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
                          builder: (context) => SignUpPageworker2(tmpArray)));
                },
                child: Text(
                  Translations.of(context).done,
                ),
              ),
            ]))));
  }
}

getCheckboxItems() {
  for (int i = 0; i < checkBoxListTileModel.length; i++) {
    if (checkBoxListTileModel[i].isCheck == true) {
      tmpArray.add(checkBoxListTileModel[i].title);
    }
  }
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});
  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 0, title: "plumper", isCheck: false),
      CheckBoxListTileModel(userId: 1, title: "homecleaning", isCheck: false),
      CheckBoxListTileModel(userId: 2, title: "repaires", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "homepainting", isCheck: false),
      CheckBoxListTileModel(userId: 4, title: "electrican", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "lunder", isCheck: false),
      CheckBoxListTileModel(userId: 6, title: "movinghome", isCheck: false),
    ];
  }
}

signupworker55() async {
  String city = selectedUser.name;
  String email = cemail.text;
  String password = cpassword.text;
  String phonenumber = cphonenumber.text;
  String username = cusername.text;
  String fullname = cfullname.text;
  String userlevel = '1';
  String descption = cdescption.text;
  var jsonResponse = null;
  http.get(
      "http://192.168.1.66:3000/newworker/$fullname/$username/$phonenumber/$password/$email/$userlevel/$city");

  http.Response response1 =
      await http.get("http://192.168.1.66:3000/getresult/$username");
  jsonResponse = jsonDecode(response1.body);
  jsonResponse = jsonResponse["username"];
  print(jsonResponse);
  http.post("http://192.168.1.66:3000/newworker2/$descption/$jsonResponse");

  print("hi");

  print(tmpArray.length);
  if (tmpArray.isNotEmpty) {
    for (int i = 0; i < tmpArray.length; i++) {
      String x = tmpArray[i];

      http.get("http://192.168.1.66:3000/addcategory/$username/$x");
      for (int j = 0; j < 1000000; j++);
    }
  }
  tmpArray.clear();
}
