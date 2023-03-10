import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/views/login/components/roundedinputfield.dart';
import 'package:myfirstproject/views/login/components/textfieldcontainer.dart';

import '../../../components/background.dart';
import 'roundedbutton.dart';
import 'roundedpasswordfield.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          RoundedInputField(
            hinttext: "your email",
            icon: Icons.person,
            onchanged: (value) {},
          ),
          roundedpasswordfield(
            onchanged: (value) {},
          ),
          roundedbutton(
            flatbuttonstyle: flatbuttonstyle,
            text: "LOGIN",
            press: () {},
            size: size,
            textcolor: Colors.white,
          )
        ],
      ),
    );
  }
}
