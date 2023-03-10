import 'package:flutter/material.dart';

class roundedbutton extends StatelessWidget {
  final String text;
  final Function press;
  final Color textcolor;
  const roundedbutton({
    super.key,
    required this.size,
    required this.flatbuttonstyle,
    required this.text,
    required this.press,
    required this.textcolor,
  });

  final Size size;
  final ButtonStyle flatbuttonstyle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: flatbuttonstyle,
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
