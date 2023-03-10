import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/network/dio_helper.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/chair/chairwidget.dart';
import 'package:myfirstproject/views/home.dart';
import 'package:myfirstproject/views/login_screen.dart';

class addchair extends StatefulWidget {
  static List<dynamic> activities = [];

  const addchair({super.key});

  @override
  State<addchair> createState() => _addchairState();
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
  //     onPressed: () {},
  padding: EdgeInsets.all(10.0),
  primary: Colors.white,
  onPrimary: Colors.blue,
  //     color: Color.fromRGBO(0,160,227,1),
  //     textColor: Colors.white,
);

class _addchairState extends State<addchair> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background-gradient2.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
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
                    Icons.list,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "My Wheelchairs",
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
                          margin: EdgeInsets.all(10),
                          height: 50.0,
                          child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {},
                            child: Text("Add New Wheelchair +",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: ListView(
                              // This next line does the trick.
                              //scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.wheelchair_pickup_rounded,
                                      size: 40,
                                    ),
                                    title: Text(
                                      'ID : 789201',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),

                                //chairwidget(),
                              ]),
                        ),
                      ),
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
