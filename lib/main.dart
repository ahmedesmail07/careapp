import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/network/dio_helper.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'dart:async';

import 'package:myfirstproject/views/widgets/heart.dart';

void main() {
  DioHelper.init();
  runApp(const healthapp());
}

class healthapp extends StatelessWidget {
  const healthapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: heart(),
    );
  }
}
