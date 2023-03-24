import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/network/dio_helper.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/login/Login.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'package:myfirstproject/views/chair/chair.dart';
import 'package:myfirstproject/views/home.dart';
import 'package:myfirstproject/views/login_screen.dart';
import 'package:myfirstproject/views/notif.dart';

import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/services/notif_service.dart';
import 'package:myfirstproject/views/signup/signup_screen.dart';
import 'dart:async';

import 'package:myfirstproject/views/widgets/heart.dart';
import 'package:myfirstproject/views/widgets/temprature.dart';

void main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const healthapp());
}

class healthapp extends StatefulWidget {
  const healthapp({super.key});

  @override
  State<healthapp> createState() => _healthappState();
}

class _healthappState extends State<healthapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(primaryColor: Colors.grey, accentColor: kPrimaryColor),
      home: login(),
      routes: {
        "login": (context) => signup(),
      },
    );
  }
}
