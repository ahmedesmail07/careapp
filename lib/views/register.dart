import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/models/user.dart';
import 'package:myfirstproject/views/Login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

var email = "";
var password = "";
Future SignUp(BuildContext cont) async {
  Map<String, dynamic> body = {
    "id": "982",
    "email": email,
    "password": password,
    "patient_full_name": "Mohamed Badr",
    "username": "Badr706",
    "phone_number": "01094189691",
    "address": "Zagazig, Egypt",
    "age": "23",
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');
  if (emailController.text == " " || passwordController.text == " ") {
    print('Fields have not to be empty');
  } else {
    var url =
        Uri.parse("https://28a5-102-184-173-88.eu.ngrok.io/patient/signup");
    var response = await http.post(url,
        headers: {'content-Type': 'application/json'},
        body: jsonBody,
        encoding: encoding);
    var result = response.body;

    print(result);

    // var data = json.decode(response.body);
    // if (data == "Success") {
    //   print("Registeration succeeded");
    //   Navigator.push(
    //     cont,
    //     MaterialPageRoute(
    //       builder: (context) => login(),
    //     ),
    //   );
    // } else {
    //   print("Registeration Failed");
    // }
  }
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      // fetch_users();
    }

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIGN UP',
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
                      print(value);
                    },
                    // validator: (value) =>
                    //     value!.isEmpty ? 'Email cannot be blank' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    controller: passwordController,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      password = value;
                      print(value);
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
                        'REGISTER',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        print(email);
                        print(password);
                        SignUp(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ),
                            );
                          },
                          child: Text('SIGN IN'))
                    ],
                  )
                ],
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
