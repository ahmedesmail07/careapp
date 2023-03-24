import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/network/dio_helper.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/chair/chairwidget.dart';
import 'package:myfirstproject/views/home.dart';
import 'package:myfirstproject/views/login/Login.dart';
import 'package:myfirstproject/views/login/components/roundedbutton.dart';
import 'package:myfirstproject/views/login/components/roundedinputfield.dart';
import 'package:myfirstproject/views/login_screen.dart';

import '../login/components/body.dart';
import 'ChairPage.dart';

class addchair extends StatefulWidget {
  static List<dynamic> activities = [];

  const addchair({super.key});

  @override
  State<addchair> createState() => _addchairState();
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: kPrimaryColor)),
  //     onPressed: () {},
  padding: EdgeInsets.all(10.0),
  primary: Colors.white,
  onPrimary: kPrimaryColor,
  //     color: Color.fromRGBO(0,160,227,1),
  //     textColor: Colors.white,
);
final ButtonStyle raisedButtonStyle2 = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: kPrimaryColor)),
  //     onPressed: () {},

  padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 10),
  primary: kPrimaryColor,
  onPrimary: kPrimaryLightColor,
  //     color: Color.fromRGBO(0,160,227,1),
  //     textColor: Colors.white,
);

Color _color = kPrimaryColor;
Color _color2 = kPrimaryColor;

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  const CardItem({
    required this.urlImage,
    required this.subtitle,
    required this.title,
  });
}

class _addchairState extends State<addchair> {
  List<CardItem> items = [
    CardItem(
        urlImage: ('assets/images/wheelchair1.jpg'),
        title: 'ID:23940',
        subtitle: 'Name:Patient1'),
    CardItem(
        urlImage: ('assets/images/wheelchair3.jpg'),
        title: 'ID:37289',
        subtitle: 'Name:Patient2'),
    CardItem(
        urlImage: ('assets/images/wheelchair2.png'),
        title: 'ID:62890',
        subtitle: 'Name:Patient3'),
    CardItem(
        urlImage: ('assets/images/wheelchair1.jpg'),
        title: 'ID:23940',
        subtitle: 'Name:Patient1'),
    CardItem(
        urlImage: ('assets/images/wheelchair3.jpg'),
        title: 'ID:37289',
        subtitle: 'Name:Patient2'),
    CardItem(
        urlImage: ('assets/images/wheelchair2.png'),
        title: 'ID:62890',
        subtitle: 'Name:Patient3'),
  ];
  String idchair = '';

  @override
  Widget build(BuildContext context) {
    // style button important
    Size size = MediaQuery.of(context).size;
    final ButtonStyle flatbuttonstyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      backgroundColor: kPrimaryColor,
    );
    //style button important
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
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Wheel-chair",
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
                    top: 10,
                    //  left: 25,
                    // right: 25,
                  ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Container(
                              height: 400,
                              padding: EdgeInsets.only(
                                  left: 35, right: 35, bottom: 20),
                              child: Center(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  // physics: PageScrollPhysics(),
                                  itemCount: items.length,
                                  itemBuilder: (context, int index) =>
                                      /**ICONS EDIT AND DELETE */
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: IconButton(
                                      //         onPressed: () {
                                      //           showDialog(
                                      //             context: context,
                                      //             builder: (context) => SimpleDialog(
                                      //               children: [
                                      //                 RoundedInputField(
                                      //                   onchanged: ((value) {
                                      //                     setState(() {
                                      //                       idchair = value;
                                      //                     });
                                      //                   }),
                                      //                   controller: null,
                                      //                   hinttext: 'add chair id',
                                      //                   icon: Icons.wheelchair_pickup,
                                      //                   validateStatus: (value) {},
                                      //                   type: TextInputType.text,
                                      //                 ),
                                      //                 roundedbutton(
                                      //                     size: size,
                                      //                     flatbuttonstyle: flatbuttonstyle,
                                      //                     text: 'Update',
                                      //                     textcolor: Colors.white,
                                      //                     press: () {
                                      //                       setState(() {
                                      //                         data[index] = idchair;
                                      //                       });
                                      //                     })
                                      //               ],
                                      //             ),
                                      //           );
                                      //         },
                                      //         icon: Icon(
                                      //           Icons.edit,
                                      //           color: _color,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: IconButton(
                                      //         onPressed: () {
                                      //           setState(() {
                                      //             data.removeAt(index);
                                      //           });
                                      //         },
                                      //         icon: Icon(
                                      //           Icons.delete,
                                      //           color: _color2,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      /**ICONS EDIT AND DELETE */
                                      Center(
                                    child: buildcard(
                                      item: items[index],
                                      delete: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            items.removeAt(index);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_rounded,
                                          size: 35,
                                          color: _color2,
                                        ),
                                      ),
                                      edit: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => SimpleDialog(
                                              children: [
                                                RoundedInputField(
                                                  onchanged: ((value) {
                                                    setState(() {
                                                      idchair = value;
                                                    });
                                                  }),
                                                  controller: null,
                                                  hinttext: 'add chair id',
                                                  icon: Icons.wheelchair_pickup,
                                                  validateStatus: (value) {},
                                                  type: TextInputType.text,
                                                ),
                                                roundedbutton(
                                                    size: size,
                                                    flatbuttonstyle:
                                                        flatbuttonstyle,
                                                    text: 'Update',
                                                    textcolor: Colors.white,
                                                    press: () {
                                                      setState(() {
                                                        //  items[index].title = idchair;
                                                      });
                                                    })
                                              ],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 25,
                                          color: _color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, _) => SizedBox(
                                    width: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                right: 10,
                                left: 10,
                                bottom: 5,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 325,
                                    height: 70,
                                    child: ElevatedButton(
                                      style: raisedButtonStyle,
                                      onPressed: () {},
                                      child: Text("Add Wheelchair +",
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 70,
                                    width: 325,
                                    margin: EdgeInsets.only(bottom: 50),
                                    child: ElevatedButton(
                                      style: raisedButtonStyle2,
                                      onPressed: () {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                      },
                                      child: Text("Submit",
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildcard({
    required CardItem item,
    required IconButton delete,
    required IconButton edit,
  }) =>
      Center(
        child: Container(
          width: 300,
          //  height: 400,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    delete,
                    edit,
                  ],
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Ink.image(
                          image: AssetImage(
                            item.urlImage,
                          ),
                          fit: BoxFit.cover,
                          child: InkWell(
                            splashColor: kPrimary2,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChairPage(item: item)));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: kPrimaryColor),
                ),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
}
