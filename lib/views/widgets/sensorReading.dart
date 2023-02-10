import 'package:flutter/material.dart';
import 'package:myfirstproject/views/widgets/heart.dart';
import 'package:myfirstproject/views/widgets/blood.dart';
import 'package:myfirstproject/views/widgets/pressure.dart';
import 'package:myfirstproject/views/widgets/temp.dart';

import 'heart.dart';

class sensorReading extends StatelessWidget {
  final textcolor;
  final String sensorName;
  final String state;
  final String pic;
  final Color1;
  final Color2;
  final index;

  List<Widget> sensors = [
    heart(),
    pressure(),
    blood(),
    temp(),
  ];
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
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print('tapped ${index}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sensors[int.parse(index)],
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
                colors: [Color1, Color2]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(pic),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                sensorName,
                style: TextStyle(
                  fontSize: 20,
                  color: textcolor,
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
