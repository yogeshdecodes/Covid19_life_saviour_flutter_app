import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lifesaviour/Dataloader.dart';

import 'package:lifesaviour/objects/Worlddata.dart';
import 'package:lifesaviour/pages/Helpline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifesaviour/pages/Awareness.dart';

import 'package:lifesaviour/pages/Searchnew.dart';
import 'package:lifesaviour/pages/Symptoms.dart';

import 'package:lifesaviour/pages/Live.dart';
import 'package:lifesaviour/pages/Faqs.dart';
import 'package:lifesaviour/pages/Developer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'SearchHospital.dart';
import 'Searchnew.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Router r = Router();
  bool _isloading;
  var _info;
  List _countries = [];
  HashMap _map = HashMap<String, Country>();

  String url = "https://corona.lmao.ninja/countries?sort=deaths";
  Future<List<Country>> fetchdata() async {
    http.Response response = await http.get(url);
    //String b = response.body.replaceAll('Iran, Islamic Republic of', 'Iran');
    List responseJson = jsonDecode(response.body);

    return responseJson.map((m) => Country.fromJson(m)).toList();
  }

  Future<http.Response> fetchall(link) async {
    http.Response r = await http.get(link);
    _isloading = false;
    return r;
  }

  @override
  void initState() {
    super.initState();
    _isloading = true;
    fetchdata().then((value) {
      for (var i = 0; i < value.length; i++) {
        List l = value[i].name.toString().split(",");
        value[i].name = l[0];
        _countries.add(value[i].name.toString());
        _map[value[i].name.toString()] = value[i];
      }
      fetchall('https://corona.lmao.ninja/all').then((res) {
        _info = jsonDecode(res.body.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdf9),
      appBar: AppBar(
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffffe3ed),
        title: Text('LIFE SAVIOUR ',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('STAY HOME STAY SAFE'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/corona.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text("Live COVID-19 Tracker"),
            leading: Icon(FontAwesomeIcons.virus),
            onTap: () {
              /* Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Live(
                        info: _info,
                        countries: _countries,
                        map: _map,
                      )));*/

              Navigator.of(context).pop();
              _isloading
                  ? showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            elevation: 24.0,
                            backgroundColor: Colors.white,
                            title: Text('No Internet Connection'),
                            content: Text('Check your connection '),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('TRY AGAIN'),
                                  onPressed: () =>
                                      Navigator.of(context).pop() &&
                                      r.route(context)),
                              FlatButton(
                                child: Text('CANCEL'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Live(
                            info: _info,
                            countries: _countries,
                            map: _map,
                          )));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Corona Awareness"),
            leading: Icon(
              FontAwesomeIcons.bullhorn,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Awareness()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Corona Symptoms"),
            leading: Icon(FontAwesomeIcons.prescription),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Symptoms()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Emergency Helpline Number"),
            leading: Icon(FontAwesomeIcons.phoneAlt),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Helpline()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("FAQs"),
            leading: Icon(FontAwesomeIcons.question),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Faqs()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Developer"),
            leading: Icon(FontAwesomeIcons.laptopCode),
            onTap: () {
              Navigator.of(context).pop();
              settingModalBottomSheet(context);
            },
          ),
          Divider(),
          Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      )),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('images/hospital.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Government Permitted',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.black,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade500,
            ),
          ),
          FlatButton(
              child: Card(
                  color: Color(0xff8ac6d1),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.solidHospital,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Corona Hospitals Near Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearchDelegateHospital());
              }),
          FlatButton(
            child: Card(
                color: Color(0xffbeebe9),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.syringe,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Corona Test Labs Near Me',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          )
        ],
      )),
    );
  }
}
