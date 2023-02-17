import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/widgets/sensorReading.dart';
import 'HomePage.dart';
import 'package:http/http.dart' as http;
import 'Welcome.dart';
import 'notif.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/views/widgets/global.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

var username = "";
var age = "";
var gender = "";

Future update(BuildContext cont) async {
  var url = Uri.parse("https://304d-197-133-196-239.eu.ngrok.io/patient/me");
  var response = await http.get(
    url,
    headers: {
      'content-Type': 'application/json',
      "Authorization": "Bearer ${token}"
    },
  );
  print(token);
  var data = json.decode(response.body);
  print(data);
  // test = "Hello";

  username = data["username"].toString();
  age = data["age"].toString();
  gender = data["gender"].toString();
}

class _homeState extends State<home> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    update(context);
    assert(debugCheckHasMaterial(context));
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 15,
            ),
            child: Expanded(
              child: Column(children: [
                //greetings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          //hello message
                                          'Hi,',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          //hello message
                                          username,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          //hello message
                                          '!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //date
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          age,
                                          style: TextStyle(
                                            color: Colors.blue[50],
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: 'Kanit',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          gender,
                                          style: TextStyle(
                                            color: Colors.blue[50],
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: 'Kanit',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/Zahraa5Ashraf/flutter/main/new%20logo%20finalllllllyyyy.jpg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Notification
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.blueGrey[600],
                    //       borderRadius: BorderRadius.circular(15)),
                    //   padding: EdgeInsets.all(12.0),
                    //   child: IconButton(
                    //       color: iconColor,
                    //       icon: Icon(
                    //         Icons.update,
                    //       ),
                    //       onPressed: () {
                    //         setState(() {
                    //           if (iconColor == Colors.white) {
                    //             iconColor = Colors.amber;
                    //           } else {
                    //             iconColor = Colors.white;
                    //           }
                    //         });
                    //       }),
                    // )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            // Add a clear button to the search bar
                            suffixIcon: IconButton(
                              icon: Icon(Icons.delete_outline_rounded),
                              onPressed: () => _searchController.clear(),
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                // Perform the search here
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //bottom layer
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 25,
                ),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      //medical state heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Current Medical Status  ',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //list view of sensor readings
                      Expanded(
                        child: GridView.count(
                          primary: false,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          childAspectRatio: (1 / 1.5),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          children: [
                            sensorReading(
                              index: '0',
                              Color1: Colors.red[100],
                              Color2: Colors.white,
                              textcolor: Colors.grey[600],
                              pic:
                                  'https://raw.githubusercontent.com/Zahraa5Ashraf/flutter/main/heartbeat.gif',
                              sensorName: 'Heart Rate',
                              state: '70-80 Safe',
                            ),
                            sensorReading(
                              index: '1',
                              Color1: Colors.purple[100],
                              Color2: Colors.white,
                              textcolor: Colors.grey[600],
                              pic:
                                  'https://raw.githubusercontent.com/Zahraa5Ashraf/flutter/main/thermometer.gif',
                              sensorName: 'Temprature',
                              state: '70-80  Safe',
                            ),
                            sensorReading(
                              index: '2',
                              Color1: Colors.blue[100],
                              Color2: Colors.white,
                              textcolor: Colors.grey[600],
                              pic:
                                  'https://raw.githubusercontent.com/Zahraa5Ashraf/flutter/main/pipette.gif',
                              sensorName: 'Sugar Blood Level',
                              state: '180-190  Dangerous',
                            ),
                            sensorReading(
                              index: '3',
                              Color1: Colors.orange[100],
                              Color2: Colors.white,
                              textcolor: Colors.grey[600],
                              pic:
                                  'https://raw.githubusercontent.com/Zahraa5Ashraf/flutter/main/blood-transfusion.gif',
                              sensorName: 'Blood Pressure',
                              state: '70-80  Safe',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
