import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/HomePage.dart';
import 'package:myfirstproject/views/Login.dart';
import 'package:myfirstproject/views/register.dart';
import 'package:myfirstproject/views/widgets/global.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

var formKey = GlobalKey<FormState>();

final emailController = TextEditingController();
final passwordController = TextEditingController();
//String uname = "robobrain@gmail.com";
//String pass = "123456";
var email = "";
var password = "";
Future Login(BuildContext cont) async {
  // String url = "https://4f83-102-184-173-88.eu.ngrok.io/patient/string";
  // final response = await http.get(Uri.parse(url));

  // var responseData = json.decode(response.body);
  // print(responseData);
  Map<String, dynamic> body = {
    "email": email,
    "password": password,
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');
  if (email == "" || password == "") {
    print('Fields have not to be empty');
  } else {
    var url =
        Uri.parse("https://545b-197-133-196-239.eu.ngrok.io/patient/login");
    var response = await http.post(url,
        headers: {'content-Type': 'application/json'},
        body: jsonBody,
        encoding: encoding);

    var data = json.decode(response.body);
    print(data);
    if (data["message"] == "Success") {
      token = data["access_token"];
      print(token);
      print("Login succeeded");
      Navigator.push(cont, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print("User not Found");
      emailController.text = "";
      passwordController.text = "";
    }
  }
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Background
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/images/background-gradient.png"))),
              )),
          //WELCOME
          Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String value) {
                          email = value;
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'Email cannot be blank' : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          //  suffixIcon: Icon(Icons.visibility),
                        ),
                        controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) =>
                            value!.isEmpty ? 'Password cannot be blank' : null,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Login(context);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => register(),
                                  ),
                                );
                              },
                              child: Text('REGISTER'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
