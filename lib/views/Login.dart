import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/views/HomePage.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import 'package:myfirstproject/views/home.dart';

import 'register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
String uname = "robobrain@gmail.com";
String pass = "123456";

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    // var emailController = TextEditingController();
    // var passwordController = TextEditingController();

    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
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
                  controller: passwordController,
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
                      if (uname == emailController.text &&
                          pass == passwordController.text) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {
                        emailController.text = "";
                        passwordController.text = "";
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
