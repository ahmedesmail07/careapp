import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myfirstproject/constants.dart';
import 'package:myfirstproject/views/chair/chair.dart';

class ChairPage extends StatelessWidget {
  final CardItem item;
  const ChairPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('WheelChair details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: AspectRatio(
                  aspectRatio: 4 / 4,
                  child: Image.asset(
                    item.urlImage,
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 35,
              ),
            ),
            Text(
              item.subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            Text(
              'Patient Details:   etc',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
