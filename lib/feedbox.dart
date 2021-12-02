import 'package:flutter/material.dart';
import 'package:mobtech/action.dart';
import 'package:mobtech/scoped_model_wrapper.dart';
import 'package:mobtech/translations.dart';
import 'package:scoped_model/scoped_model.dart';

//the feed box will have for parameters :
// the user name , the user avatar, the pub date, the content text and content img
Widget feedBox(String avatarUrl, String userName, String date,
    String contentText, String contentImg) {
  return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Container(
            margin: EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.lightBlue[400]),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl),
                        radius: 25.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (contentText != "")
                    Text(
                      contentText,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
                  if (contentImg != "") Image.network(contentImg),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFF505050),
                  ),
                  Row(
                    children: [
                      actionButton(
                          Icons.work,
                          Translations.of(context).takethisjob,
                          Color(0xFF505050)),
                    ],
                  )
                ],
              ),
            ),
          ));
}
