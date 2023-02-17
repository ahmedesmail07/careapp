import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstproject/models/user.dart';
import 'package:myfirstproject/views/Welcome.dart';
import 'package:myfirstproject/views/login_screen.dart';
import 'package:myfirstproject/views/successful.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

var token = "";

var formkey = GlobalKey<FormState>();
var email = "";
var password = "";
var fullname = "";
var username = "";
var id = "";
var phone = "";
var address = "";
var age = "";
var gender = "male";
Future SignUp(BuildContext cont) async {
  Map<String, dynamic> body = {
    "id": id,
    "email": email,
    "password": password,
    "patient_full_name": fullname,
    "username": username,
    "phone_number": phone,
    "address": address,
    "age": age,
    "gender": gender,
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');
  if (email == "" ||
      password == "" ||
      id == "" ||
      fullname == "" ||
      username == "" ||
      phone == "" ||
      address == "" ||
      age == "") {
    print('Fields have not to be empty');
  } else {
    var url =
        Uri.parse("https://304d-197-133-196-239.eu.ngrok.io/patient/signup");
    var response = await http.post(url,
        headers: {'content-Type': 'application/json'},
        body: jsonBody,
        encoding: encoding);
    var result = response.body;
    print(result);

    Navigator.pop(
      cont,
    );

    print('Registration successful');
    print(result);

    var data = json.decode(response.body);
    if (data["message"] == "Success") {
      token = data["access_token"];
      print("Registeration succeeded");
      Navigator.pop(
        cont,
        MaterialPageRoute(
          builder: (context) => successful(),
        ),
      );
    } else {
      print("Registeration Failed");
    }
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
    var idController = TextEditingController();
    var usernameController = TextEditingController();
    var fullnameController = TextEditingController();
    var addressController = TextEditingController();
    var ageController = TextEditingController();
    var phoneController = TextEditingController();
    //var gender =

    return Scaffold(
      //appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "assets/images/background-gradient.png"))),
              )),
          Form(
            key: formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 100.0, left: 20, right: 20, bottom: 40),
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
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
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
                          onChanged: (String value) {
                            password = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Fullname',
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller: fullnameController,
                          onChanged: (String value) {
                            fullname = value;
                          },
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_pin_rounded),
                          ),
                          controller: usernameController,
                          onChanged: (String value) {
                            username = value;
                          },
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'City',
                            prefixIcon: Icon(Icons.map),
                          ),
                          controller: addressController,
                          onChanged: (String value) {
                            address = value;
                          },
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Chair ID',
                            prefixIcon: Icon(Icons.wheelchair_pickup),
                          ),
                          controller: idController,
                          onChanged: (String value) {
                            id = value;
                          },
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone),
                          ),
                          controller: phoneController,
                          onChanged: (String value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Age',
                            prefixIcon: Icon(Icons.lock_clock),
                          ),
                          controller: ageController,
                          onChanged: (String value) {
                            age = value;
                          },
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                        ),
                        DropdownButton<String>(
                          value: gender,
                          items: ['male', 'female'].map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                          hint: Text('Select a color'),
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
                              if (formkey.currentState!.validate()) {
                                SignUp(context);
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
                            Text('Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
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
          ),
        ],
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
