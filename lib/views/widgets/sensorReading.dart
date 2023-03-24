import 'package:flutter/material.dart';
import 'package:myfirstproject/views/global.dart';
import 'package:myfirstproject/views/widgets/heart.dart';
import 'package:myfirstproject/views/widgets/blood.dart';
import 'package:myfirstproject/views/widgets/temprature.dart';
import 'package:myfirstproject/views/widgets/temp.dart';
import 'package:myfirstproject/views/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../register.dart';
import '../services/notif_service.dart';
import 'heart.dart';

class sensorReading extends StatefulWidget {
  final textcolor;
  final String sensorName;
  final String state;
  final String pic;
  final Color1;
  final Color2;
  final index;

  sensorReading({
    Key? key,
    required this.textcolor,
    required this.sensorName,
    required this.state,
    required this.Color1,
    required this.Color2,
    required this.pic,
    required this.index,
  }) : super(key: key);

  @override
  State<sensorReading> createState() => _sensorReadingState();
}

var heartint = 0.0;
var tempint = 0.0;
var heart2;
var temp2;
Future sensorupdate(BuildContext cont) async {
  var url = Uri.parse("https://cba7-196-221-98-202.eu.ngrok.io/chair/data");
  var response = await http.get(
    url,
    headers: {
      'content-Type': 'application/json',
      "Authorization": "Bearer ${token}"
    },
  );
  /*remove this comments*/
  //var data = json.decode(response.body);
  //print(data);
  // heartint = data["heart_rate"];
  //tempint = data["body_temperature"];
  //heart2 = data["heart_rate"].toString();
  //temp2 = data["body_temperature"].toString();
  //print(heart2);
  //print(temp2);
  /*remove this comments*/

  heart2 = '100';
  temp2 = '40';
  heartint = 100;
  tempint = 40;
  if (heartint > 90 || heartint < 50) {
    NotificationService().showNotification(
        title: 'Heart Emergency',
        body: 'Heart Rate is high Go to the hospital immediately!');
  }
  if (tempint > 37 || tempint < 35) {
    NotificationService().showNotification(
        title: 'Temprature Emergency',
        body: 'body Temp Rate is high Call the doctor immediately!');
  }
}

class _sensorReadingState extends State<sensorReading> {
  List<Widget> sensors = [
    heart(),
    temprature(),
    blood(),
    temp(),
  ];

  @override
  Widget build(BuildContext context) {
    sensorupdate(context);
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            Token.heartreading = heart2;
            Token.tempreading = temp2;
          });
          print('tapped ${widget.index}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sensors[int.parse(widget.index)],
            ),
          );
        },
        child: Container(
          height: 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [widget.Color1, widget.Color2]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.pic),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.sensorName,
                style: TextStyle(
                  fontSize: 20,
                  color: widget.textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // child: ListTile(
          //   leading: ClipRRect(
          //     borderRadius: BorderRadius.circular(12),
          //     child: Container(
          //       padding: EdgeInsets.all(5),
          //       color: Color,
          //       child: Image.asset(
          //         pic,
          //         height: 70.0,
          //         width: 70,
          //       ),
          //     ),
          //   ),
          //   title: Text(
          //     sensorName,
          //     style: TextStyle(
          //       color: Colors.grey[600],
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20,
          //     ),
          //   ),
          //   subtitle: Text(
          //     state,
          //     style: TextStyle(
          //       color: Colors.grey[500],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
