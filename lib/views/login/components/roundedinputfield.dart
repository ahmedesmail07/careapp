import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'textfieldcontainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final ValueChanged<String> onchanged;

  const RoundedInputField({
    super.key,
    required this.hinttext,
    required this.icon,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            hintText: hinttext,
            border: InputBorder.none),
      ),
    );
  }
}
