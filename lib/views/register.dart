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

// Future fetch_users() async {
//   var response = await http.get(Uri.parse('http://localhost:8000'));
//   var users = [];
//   for (var u in jsonDecode(response.body)) {
//     users.add(
//       User(u['id'], u['email'], u['name'], u['password']),
//     );
//   }
//   print(users);
//   return users;
// }

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
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    controller: emailController,
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
                        'REGISTER',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {},
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
