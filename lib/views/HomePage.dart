import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'package:myfirstproject/views/login_screen.dart';
import 'package:myfirstproject/views/map.dart';
import 'package:myfirstproject/views/notif.dart';
import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/widgets/emoji.dart';
import 'package:myfirstproject/views/widgets/sensorReading.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final String Username;
  final String Age;
  final String Gender;

  HomePage({
    required this.Username,
    required this.Age,
    required this.Gender,
  });

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
    home(
      age: globalage,
      gender: globalgender,
      username: globalusername,
    ),
    map(),
    notif(),
  ];

  @override
  Widget build(BuildContext context) {
    //update(context);
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
                  icon: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Icon(
                          CupertinoIcons.ellipses_bubble_fill,
                        ),
                        CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                        )
                      ]),
                  label: ''),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}
