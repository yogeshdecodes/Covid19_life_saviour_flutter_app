import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 320.0,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage('images/profile.jpg'),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Yogesh Yadav',
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            onPressed: () async {
                              await _launchURL(
                                  "mailto:yadavyogesh.ai@gmail.com");
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.email),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Contact'),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Divider(),
              Text(
                'Social Links',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () async {
                              await _launchURL("https://github.com/yogesh-io");
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.github),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Github'),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () async {
                              await _launchURL(
                                  "https://linkedin.com/in/yogesh-io");
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: Colors.blue.shade700,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('LinkedIn'),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () async {
                              await _launchURL("https://twitter.com/yogesh_io");
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.lightBlueAccent,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Twitter'),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            onPressed: () async {
                              await _launchURL(
                                  "https://instagram.com/yogesh.io");
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Instagram'),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Version: 1.0.1',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Made with ❤️ in India',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      });
}
