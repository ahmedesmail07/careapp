import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'package:myfirstproject/views/login/components/roundedinputfield.dart';
import 'package:myfirstproject/views/login/components/textfieldcontainer.dart';
import 'package:myfirstproject/views/login_screen.dart';
import 'package:myfirstproject/views/map.dart';
import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/signup/signup_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/views/global.dart';

import 'alreadyhaveaccount.dart';
import 'roundedbutton.dart';
import 'roundedpasswordfield.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

/* For HoME Page */
bool check = false;
var globalusername = 'Zahraa';
var globalage = '23';
var globalgender = 'Female';
var Username = 'SUCCESS';
var Age = 'FUCK';
var Gender = 'YEAH';
var Heart;
/* For HoME Page */

/* Variables*/
var token = "";
var formkey2 = GlobalKey<FormState>();
var email = "";
var password = "";
/* Variables*/

class _BodyState extends State<Body> {
  /* Controllers */
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  /* Controllers */
  @override
  Widget build(BuildContext context) {
    bool value = false;
    Size size = MediaQuery.of(context).size;
    // style button important
    final ButtonStyle flatbuttonstyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      backgroundColor: kPrimaryColor,
    );
    //style button important
    return Container(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.4,
                ),
              ),
              Form(
                key: formkey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Image.asset(
                      "assets/icons/login_top.png",
                      height: size.height * 0.35,
                    ),
                    RoundedInputField(
                      onchanged: (String value) {
                        email = value;
                      },
                      validateStatus: (value) {
                        if (value!.isEmpty) {
                          return 'Field must not be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hinttext: "your email",
                      icon: Icons.person,
                    ),
                    roundedpasswordfield(
                      validateStatus: (value) {
                        if (value!.isEmpty) {
                          return 'Field must not be empty';
                        }
                        return null;
                      },
                      onchanged: (value) {
                        password = value;
                      },
                      controller: passwordController,
                      passwordVisible: true,
                    ),
                    roundedbutton(
                      flatbuttonstyle: flatbuttonstyle,
                      text: "LOGIN",
                      press: () {
                        if (formkey2.currentState!.validate()) {
                          print('successful');
                          _login();
                          reload();
                        }
                      },
                      size: size,
                      textcolor: Colors.white,
                    ),
                    alreadyhaveaccount(
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signup(),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    globalusername = Username;
    globalage = Age;
    globalgender = Gender;

    /* UNCOMMENT WHEN SERVER ONLINE */
    // Map<String, dynamic> body = {
    //   "email": email,
    //   "password": password,
    // };
    // String jsonBody = json.encode(body);
    // final encoding = Encoding.getByName('utf-8');
    // if (email == "" || password == "") {
    //   print('Fields have not to be empty');
    // } else {
    //   var url =
    //       Uri.parse("https://cba7-196-221-98-202.eu.ngrok.io/patient/login");

    // var response = await http.post(url,
    //     headers: {
    //       'content-Type': 'application/json',
    //     },
    //     body: jsonBody,
    //     encoding: encoding);

    // var data = json.decode(response.body);
    // print(data);
    // if (data["message"] == "Success") {
    //   token = data["access_token"];
    //   print(token);
    //   print("Login succeeded");
    // }
    /* UNCOMMENT WHEN SERVER ONLINE */
    // }

    // var url2 = Uri.parse("https://cba7-196-221-98-202.eu.ngrok.io/patient/me");

    /* UNCOMMENT WHEN SERVER ONLINE */
    // var response = await http.get(
    //   url2,
    //   headers: {
    //     'content-Type': 'application/json',
    //     "Authorization": "Bearer ${token}"
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var data2 = json.decode(response.body);
    //   print(data2);
    //   Username = data2["username"].toString();
    //   Gender = data2["gender"].toString();
    //   Age = data2["age"].toString();
    //   globalusername = Username;
    //   globalage = Age;
    //   globalgender = Gender;
    //   print('Username=$Username');
    //   print('global username=$globalusername');
    // }
    /* UNCOMMENT WHEN SERVER ONLINE */
  }

  Future<void> reload() async {
    check = true;
    print(check);
    await Future.delayed(Duration(seconds: 3));
    print('after 3 secs $check');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  Age: globalage,
                  Username: globalusername,
                  Gender: globalgender,
                )));
    return;
  }
}
