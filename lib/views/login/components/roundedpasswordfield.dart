import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'textfieldcontainer.dart';

class roundedpasswordfield extends StatelessWidget {
  final ValueChanged<String> onchanged;
  const roundedpasswordfield({
    super.key,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: "password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
