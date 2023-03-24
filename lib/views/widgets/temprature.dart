import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/network/dio_helper.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/global.dart';
import 'package:myfirstproject/views/widgets/temp.dart';

import '../home.dart';
import '../login/components/body.dart';
import '../register.dart';

class temprature extends StatefulWidget {
  static List<dynamic> activities = [];

  //const temprature({super.key});

  @override
  State<temprature> createState() => _tempratureState();
}

class _tempratureState extends State<temprature> {
  @override
  Widget build(BuildContext context) {
    //update(context);

    // DioHelper.getData(url: 'activity/', query: {'': ''}).then((value) {
    //   print(value!.data['type'].toString());
    //   test = value.data['type'].toString();
    // }).catchError((error) {
    //   print(error.toString());
    // });
    return Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/animatedbackground.gif'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //apiCall();
            });
          },
          child: Icon(Icons.update),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          Age: globalage,
                          Username: globalusername,
                          Gender: globalgender,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Temprature",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 25,
                    //  left: 25,
                    // right: 25,
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 142, 205, 235),
                              width: 7.0,
                            ),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  '11 February',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 114, 109, 109)),
                                ),
                                Text(
                                  Token.tempreading,
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: Color.fromARGB(255, 73, 71, 71)),
                                ),
                                Text(
                                  '🌡 Celisus',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 114, 109, 109)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 130,
                        width: 600,
                        margin: const EdgeInsets.all(30.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: [
                                    Text(
                                      "💠 ",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    Text(
                                      "51",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                  ],
                                ),
                                Text(
                                  "MIN:4 DEC",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: [
                                    Text(
                                      "⛔️ ",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    Text(
                                      "40",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                  ],
                                ),
                                Text(
                                  "MAX:7 FEB",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
