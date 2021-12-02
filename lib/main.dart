import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import
//import 'dart:async';
//import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:mobtech/category.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/singupmain.dart';
import 'package:mobtech/translations.dart';
import 'package:mobtech/translations_delegate.dart';
import 'package:mobtech/workersideprofile.dart';
import 'package:scoped_model/scoped_model.dart';


void main() {
  runApp(new ScopeModelWrapper());
}

var userentery;
var user = userentery;
String userlevel = null;
final cpassword = TextEditingController();
final cusername = TextEditingController();

class MyApp extends StatelessWidget {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => new MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (BuildContext context) =>
          Translations.of(context).title,
          localizationsDelegates: [
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: model.appLocal,
          supportedLocales: model.supportedLocales,
          home: new LoginPage(),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => Stack(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: new Column(
                  children: <Widget>[
                    _getHeader(context),
                    _getTextFields(context),
                    _getSignIn(context),
                    _getBottomRow(context),
                  ],
                ),
              ),
              _getBackBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

_getBackBtn() {
  return Positioned(
    top: 35,
    left: 25,
    child: Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
    ),
  );
}

_getBottomRow(context) {
  return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpmain()));
              },
              child: Text(
                Translations.of(context).signup,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text(
              Translations.of(context).forgetpass,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
            new SizedBox(
                width: 70.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    model.chagneLanguge();
                  },
                  child: new Text(
                    Translations.of(context).changeLanguage,
                    style:
                    new TextStyle(color: Colors.white, fontSize: 8.0),
                  ),
                )),
          ],
        ),
      ));
}

_getSignIn(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          Translations.of(context).signin,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: 25,
          child: IconButton(
              icon: Icon(Icons.arrow_forward),
              color: Colors.white,
              iconSize: 26,
              onPressed: () {
                //signin();
                Future.delayed(Duration(milliseconds: 100), () {
                  signin();
                });
                if (userlevel == "0") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAp(userentery)),
                  );
                }
                if (userlevel == "1") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => workersideProfile()),
                  );
                } else {
                  print("no user found");
                }
                /* signin();
 
               if(userlevel=="0"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyAp()),
                );
 
              }
              if(userlevel=="1"){
 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => workersideProfile()),
                );
                  }
                  else{
                    print("no user found");
                  }  */
              }),
        )
      ],
    ),
  );
}

_getTextFields(context) {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: cusername,
          decoration:
          InputDecoration(labelText: Translations.of(context).username),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: cpassword,
          decoration: InputDecoration(
            labelText: Translations.of(context).password,
          ),
        ),
        SizedBox(
          height: 25,
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
        Translations.of(context).signin,
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

signin() async {
  var jsonRespons = null;

  String password = cpassword.text;
  String username = cusername.text;
  Uri myUri = Uri.parse("http://192.168.1.105:3000/login/$username/$password");

  http.Response response = await http.get(myUri);

  jsonRespons = jsonDecode(response.body);
  userentery = jsonRespons;
  userlevel = jsonRespons["userlevel"].toString();

  print(userlevel);
}
