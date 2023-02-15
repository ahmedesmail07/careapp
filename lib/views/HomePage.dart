import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'package:myfirstproject/views/map.dart';
import 'package:myfirstproject/views/notif.dart';
import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/widgets/emoji.dart';
import 'package:myfirstproject/views/widgets/sensorReading.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color iconColor = Colors.white;

  List _users = [];
  final TextEditingController _searchController = TextEditingController();
  //////////////////////////new code
  int pageIndex = 0;
  int currentIndex = 0;
  /////////////////new code
  List<Widget> screens = [
    home(),
    map(),
    notif(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background-gradient2.jpg'),
            fit: BoxFit.cover),
        // gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Colors.deepPurple, Colors.deepOrange])),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            elevation: 10,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.house_alt_fill,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.location_solid,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.ellipses_bubble_fill,
                  ),
                  label: ''),
            ]),
        body: screens[currentIndex],
      ),
    );
  }

  Future loaduserlist() async {
    var res = await http.get(Uri.https(
      "dummyjson.com",
      "users",
    ));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      print(jsonData);
      _users.addAll(jsonData);
    }
  }
}
