import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/HomePage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/views/home.dart';
import 'package:myfirstproject/views/login_screen.dart';

import 'register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

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
        Uri.parse("https://4f83-102-184-173-88.eu.ngrok.io/patient/login");
    var response = await http.post(url,
        headers: {'content-Type': 'application/json'},
        body: jsonBody,
        encoding: encoding);

    var data = json.decode(response.body);
    print(data);
    if (data == "Success") {
      print("Login succeeded");
      Navigator.push(
          cont,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    Age: globalage,
                    Username: globalusername,
                    Gender: globalgender,
                  )));
    } else {
      print("User not Found");
      emailController.text = "";
      passwordController.text = "";
    }
  }
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    // var emailController = TextEditingController();
    // var passwordController = TextEditingController();

    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Expanded(
            flex: 3,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.deepPurple, Colors.deepOrange])),
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
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
                        //suffixIcon: Icon(Icons.visibility),
                      ),
                      controller: passwordController,
                      onChanged: (value) {
                        password = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      // validator: (value) =>
                      //     value!.isEmpty ? 'Password cannot be blank' : null,
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
                          Login(context);
                          print(email);
                          print(password);
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
      ),
    );
  }
}

// void validateAndSave() {
//   final FormState form = _formKey.currentState;
//   if (form.validate()) {
//     print('Form is valid');
//   } else {
//     print('Form is invalid');
//   }
// }
